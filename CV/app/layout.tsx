import "./globals.css"
import { Inter } from "next/font/google"
import type React from "react"
import Script from "next/script"
import { publicationsData } from "@/data/publicationsData"
import ScrollProgress from "@/components/ScrollProgress"

const inter = Inter({ subsets: ["latin"] })

export const metadata = {
  title: {
    default: "Alon Yehezkel's CV",
    template: "%s | Alon Yehezkel's CV",
  },
  description: "Resume of an experienced, professional software engineer.",
  icons: {
    icon: [
      { url: "/favicon.ico" },
      { url: "/profile.png", type: "image/png" },
    ],
  },
  openGraph: {
    title: "Alon Yehezkel's CV",
    description: "Resume of an experienced, professional software engineer.",
    url: "https://alonn24.github.io",
    images: [
      {
        url: "/images/cover.jpg",
        alt: "Alon Yehezkel",
      },
    ],
    type: "website",
  },
  twitter: {
    card: "summary_large_image",
    title: "Alon Yehezkel's CV",
    description: "Resume of an experienced, professional software engineer.",
    images: ["/images/cover.jpg"],
  },
  viewport: {
    width: "device-width",
    initialScale: 1,
  },
  themeColor: "#000000",
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
        <meta name="keywords" content="resume, software, web, javascript, nodejs, fullstack, cloud" />
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
      <body className={inter.className}>
        <ScrollProgress />
        {children}
      </body>
    </html>
  )
}

