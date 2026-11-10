import { FaDev, FaLinkedin, FaMedium } from "react-icons/fa"

export const publicationsData = [
  {
    platform: "Medium",
    url: "https://medium.com/@alonn24",
    icon: FaMedium,
    description: "Technical articles about software development, leadership, and best practices",
    author: "Alon Yehezkel",
    datePublished: "2023-01-01", // Replace with actual date of first publication
    publisher: {
      "@type": "Organization",
      name: "Medium",
      logo: {
        "@type": "ImageObject",
        url: "https://medium.com/favicon.ico",
      },
    },
  },
  {
    platform: "Dev.to",
    url: "https://dev.to/alonn24",
    icon: FaDev,
    description: "Community posts about clean code, testing, and software architecture",
    author: "Alon Yehezkel",
    datePublished: "2023-01-01", // Replace with actual date of first publication
    publisher: {
      "@type": "Organization",
      name: "DEV Community",
      logo: {
        "@type": "ImageObject",
        url: "https://dev.to/favicon.ico",
      },
    },
  },
  {
    platform: "LinkedIn",
    url: "https://www.linkedin.com/in/alonn24/",
    icon: FaLinkedin,
    description:
      "With The Client JS API, We Can Report Data To New Relic And Query It With Insights. (IT Central Station, Mar 2016)",
    author: "Alon Yehezkel",
    datePublished: "2016-03-01",
    publisher: {
      "@type": "Organization",
      name: "IT Central Station",
    },
  },
]
