
import fs from "node:fs/promises"
import path from "node:path"
import Link from "next/link"
import matter from "gray-matter"

type PublicationInfo = {
  slug: string
  title: string
  summary: string | null
  author: string | null
  publishedAtISO: string | null
}

const dateFormatter = new Intl.DateTimeFormat("en-US", { dateStyle: "long" })

async function getPublications(): Promise<PublicationInfo[]> {
  const publicationsDir = path.join(process.cwd(), "data", "publications")
  const files = await fs.readdir(publicationsDir)

  const markdownFiles = files.filter((file) => file.endsWith(".md"))

  const publications = await Promise.all(
    markdownFiles.map(async (file) => {
      const filePath = path.join(publicationsDir, file)
      const contents = await fs.readFile(filePath, "utf-8")
      const { data, content } = matter(contents)

      const slug = file.replace(/\.md$/, "")
      const title =
        typeof data.title === "string" && data.title.trim().length > 0
          ? data.title.trim()
          : content
              .split(/\r?\n/)
              .map((line) => line.trim())
              .find((line) => line.startsWith("# "))
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

      return {
        slug,
        title,
        summary,
        author,
        publishedAtISO,
      }
    }),
  )

  publications.sort((a, b) => {
    const aTime = a.publishedAtISO ? new Date(a.publishedAtISO).getTime() : 0
    const bTime = b.publishedAtISO ? new Date(b.publishedAtISO).getTime() : 0

    if (aTime === bTime) {
      return a.title.localeCompare(b.title)
    }

    return bTime - aTime
  })

  return publications
}

export default async function PublicationsPage() {
  const publications = await getPublications()

  return (
    <div className="bg-gray-900 min-h-dvh text-white">
      <div className="container mx-auto px-4 py-16">
        <h1 className="text-4xl font-bold mb-8 text-center text-red-500">Publications</h1>
        {publications.length === 0 ? (
          <p className="text-center text-gray-400">No publications available yet. Check back soon.</p>
        ) : (
          <ul className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {publications.map((publication) => (
              <li key={publication.slug}>
                <Link
                  href={`/publications/${publication.slug}`}
                  className="block rounded-lg border border-gray-700 bg-gray-800 p-6 transition-colors hover:border-red-500"
                >
                  <h2 className="text-2xl font-semibold text-white">{publication.title}</h2>
                  {(publication.author || publication.publishedAtISO) && (
                    <p className="mt-2 text-sm text-gray-400">
                      {publication.author && <span>{publication.author}</span>}
                      {publication.author && publication.publishedAtISO && <span className="mx-2">•</span>}
                      {publication.publishedAtISO && (
                        <time dateTime={publication.publishedAtISO}>
                          {dateFormatter.format(new Date(publication.publishedAtISO))}
                        </time>
                      )}
                    </p>
                  )}
                  {publication.summary && <p className="mt-3 text-gray-300">{publication.summary}</p>}
                </Link>
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  )
}


