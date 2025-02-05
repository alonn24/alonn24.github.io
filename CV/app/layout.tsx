import "./globals.css"
import { Inter } from "next/font/google"
import type React from "react"
import Script from "next/script"

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
  return (
    <html lang="en">
      <head>
        <meta charSet="utf-8" />
        <link rel="icon" href="/favicon.ico" />
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
          id="schema-script"
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              "@context": "https://schema.org/",
              "@type": "Person",
              name: "Alon Yehezkel",
              url: "https://alonn24.github.io",
              image: "https://alonn24.github.io/images/my-profile.png",
              sameAs: [
                "https://www.facebook.com/alon.yehezkel.1",
                "https://twitter.com/alonn24",
                "https://www.linkedin.com/in/alonn24",
                "https://github.com/alonn24",
              ],
              jobTitle: "Software Engineer",
              worksFor: {
                "@type": "Organization",
                name: "Bookaway",
              },
            }),
          }}
        />
      </head>
      <body className={inter.className}>{children}</body>
    </html>
  )
}

