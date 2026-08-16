export interface EducationEntry {
  organization: string
  title: string
  start: string
  end: string
  credentialUrl?: string
}

export const educationData: { timeline: EducationEntry[] } = {
  timeline: [
    {
      organization: "NeuroLeadership Institute",
      title: "Brain-Based Conversation Skills",
      start: "Aug 2026",
      end: "Aug 2026",
      credentialUrl: "https://www.credly.com/badges/d0f054e6-049a-4514-a334-5441ba7cb2e9",
    },
    {
      organization: "Yozmot College",
      title: "NLP (Neuro-Linguistic Programming) Master Practitioner",
      start: "2024",
      end: "2025",
      credentialUrl: "https://drive.google.com/file/d/1nUx6aXTZilx4QzOkcO_6u9LMyarCnZyR/view",
    },
    {
      organization: "The Open University, Israel",
      title: "B.A., Computer Science - Systems & Applications.",
      start: "2006",
      end: "2014",
    },
    {
      organization: "Mamram",
      title: "Computer Science",
      start: "2006",
      end: "2006",
    },
    {
      organization: "Makif D, Ashdod",
      title: "High School, Computer technology / Computer Systems Technology",
      start: "1999",
      end: "2005",
    },
  ],
}
