import "./globals.css"
import { Inter } from "next/font/google"
import type React from "react"
import Script from "next/script"
import { publicationsData } from "@/data/publicationsData"

const inter = Inter({ subsets: ["latin"] })

export const metadata = {
  title: "Alon Yehezkel's CV",
  description: "Resume of an experienced, professional software engineer.",
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const schemaData = {
    "@context": "https://schema.org/",
    "@type": "Person",
    name: "Alon Yehezkel",
    url: "https://alonn24.github.io",
    image: "https://alonn24.github.io/profile.png",
    sameAs: [
      "https://www.facebook.com/alon.yehezkel.1",
      "https://twitter.com/alonn24",
      "https://www.linkedin.com/in/alonn24",
      "https://github.com/alonn24",
    ],
    jobTitle: "Software Engineer",
    worksFor: {
      "@type": "Organization",
      name: "Snappy",
    },
    mainEntityOfPage: {
      "@type": "WebPage",
      "@id": "https://alonn24.github.io",
    },
    author: {
      "@type": "Person",
      name: "Alon Yehezkel",
    },
    publisher: {
      "@type": "Person",
      name: "Alon Yehezkel",
    },
  }

  const publicationsSchema = publicationsData.map((pub) => ({
    "@context": "https://schema.org/",
    "@type": "Article",
    headline: `${pub.platform} Publications by Alon Yehezkel`,
    author: {
      "@type": "Person",
      name: pub.author,
    },
    datePublished: pub.datePublished,
    publisher: pub.publisher,
    url: pub.url,
    description: pub.description,
  }))

  return (
    <html lang="en">
      <head>
        <meta charSet="utf-8" />
        <link rel="icon" href="/favicon.ico" />
        <link rel="icon" type="image/png" href="/profile.png" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="theme-color" content="#000000" />

        <title>{metadata.title}</title>
        <meta name="description" content={metadata.description} />
        <meta name="keywords" content="resume, software, web, javascript, nodejs, fullstack, cloud" />
        <meta property="og:title" content={metadata.title} />
        <meta property="og:url" content="/images/cover.jpg" />
        <meta property="og:description" content={metadata.description} />
        <meta property="og:image" content="/images/cover.jpg" />
        <meta name="twitter:card" content="summary_large_image" />
        <meta name="twitter:title" content={metadata.title} />
        <meta name="twitter:image" content="/images/cover.jpg" />
        <meta name="twitter:description" content={metadata.description} />

        <link rel="apple-touch-icon" href="/logo192.png" />
        <link rel="manifest" href="/manifest.json" />

        <Script
          id="schema-person"
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify(schemaData),
          }}
        />
        <Script
          id="schema-publications"
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify(publicationsSchema),
          }}
        />
      </head>
      <body className={inter.className}>{children}</body>
    </html>
  )
}

