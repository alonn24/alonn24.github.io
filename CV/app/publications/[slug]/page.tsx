import fs from "node:fs/promises"
import path from "node:path"
import type { Metadata } from "next"
import Link from "next/link"
import { notFound } from "next/navigation"
import matter from "gray-matter"
import { remark } from "remark"
import remarkHtml from "remark-html"

type Publication = {
  title: string
  author: string | null
  summary: string | null
  publishedAtISO: string | null
  contentHtml: string
}

const PUBLICATIONS_DIR = path.join(process.cwd(), "data", "publications")
const dateFormatter = new Intl.DateTimeFormat("en-US", { dateStyle: "long" })

async function getPublicationSlugs(): Promise<string[]> {
  const entries = await fs.readdir(PUBLICATIONS_DIR)
  return entries.filter((entry) => entry.endsWith(".md")).map((entry) => entry.replace(/\.md$/, ""))
}

async function loadPublication(slug: string): Promise<Publication | null> {
  const filePath = path.join(PUBLICATIONS_DIR, `${slug}.md`)

  try {
    const raw = await fs.readFile(filePath, "utf-8")
    const { data, content } = matter(raw)

    const title =
      typeof data.title === "string" && data.title.trim().length > 0
        ? data.title.trim()
        : content
            .split(/\r?\n/)
            .map((line) => line.trim())
            .find((line) => /^#\s+/.test(line))
            ?.replace(/^#\s*/, "")
            ?.trim() ??
          slug
            .split("-")
            .map((segment) => segment.charAt(0).toUpperCase() + segment.slice(1))
            .join(" ")

    const author = typeof data.author === "string" && data.author.trim().length > 0 ? data.author.trim() : null

    const dateValue = data.date ? new Date(data.date) : null
    const publishedAtISO = dateValue && !Number.isNaN(dateValue.valueOf()) ? dateValue.toISOString() : null

    const summary =
      typeof data.summary === "string" && data.summary.trim().length > 0
        ? data.summary.trim()
        : content
            .split(/\r?\n/)
            .map((line) => line.trim())
            .filter((line) => line.length > 0 && !line.startsWith("#"))
            .slice(0, 2)
            .join(" ")
            .trim() || null

    const processed = await remark().use(remarkHtml).process(content)

    return {
      title,
      author,
      summary,
      publishedAtISO,
      contentHtml: processed.toString(),
    }
  } catch (error: unknown) {
    if (error instanceof Error && "code" in error && (error as { code?: string }).code === "ENOENT") {
      return null
    }

    throw error
  }
}

type PublicationPageProps = {
  params: {
    slug: string
  }
}

export async function generateStaticParams() {
  const slugs = await getPublicationSlugs()
  return slugs.map((slug) => ({ slug }))
}

export async function generateMetadata({ params }: PublicationPageProps): Promise<Metadata> {
  const publication = await loadPublication(params.slug)

  if (!publication) {
    return {
      title: "Publication Not Found",
    }
  }

  return {
    title: `${publication.title} · Publications`,
    description:
      publication.summary ??
      (publication.author ? `Read ${publication.title} by ${publication.author}.` : `Read ${publication.title}.`),
  }
}

export default async function PublicationPage({ params }: PublicationPageProps) {
  const publication = await loadPublication(params.slug)

  if (!publication) {
    notFound()
  }

  return (
    <div className="bg-gray-900 min-h-dvh text-white">
      <div className="container mx-auto px-4 py-16">
        <Link
          href="/publications"
          className="inline-flex items-center text-sm font-medium text-red-400 transition-colors hover:text-red-300"
        >
          ← Back to Publications
        </Link>
        <article className="mt-6 rounded-xl border border-gray-700 bg-gray-800 p-8 shadow-lg">
          <header className="border-b border-gray-700 pb-6">
            <h1 className="text-4xl font-bold text-red-500">{publication.title}</h1>
            {(publication.author || publication.publishedAtISO) && (
              <p className="mt-3 text-sm text-gray-400">
                {publication.author && <span>{publication.author}</span>}
                {publication.author && publication.publishedAtISO && <span className="mx-2">•</span>}
                {publication.publishedAtISO && (
                  <time dateTime={publication.publishedAtISO}>
                    {dateFormatter.format(new Date(publication.publishedAtISO))}
                  </time>
                )}
              </p>
            )}
          </header>
          <div
            className="mt-6 space-y-6 text-gray-200 [&>p]:leading-7 [&>p]:text-gray-300 [&>h2]:text-3xl [&>h2]:font-semibold [&>h2]:text-white [&>h2]:tracking-tight [&>h3]:text-2xl [&>h3]:font-semibold [&>h3]:text-white [&>blockquote]:border-l-4 [&>blockquote]:border-red-500 [&>blockquote]:pl-4 [&>blockquote]:text-gray-300 [&>ul]:list-disc [&>ul]:pl-6 [&>ol]:list-decimal [&>ol]:pl-6 [&_a]:text-red-400 [&_a:hover]:text-red-300 [&_strong]:font-semibold"
            dangerouslySetInnerHTML={{ __html: publication.contentHtml }}
          />
        </article>
      </div>
    </div>
  )
}


