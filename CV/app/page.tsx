import dynamic from "next/dynamic"
import Profile from "../components/Profile"
import Skills from "../components/Skills"
import Experience from "../components/Experience"
import Education from "../components/Education"
import RotatingQuotes from "../components/RotatingQuotes"
import Publications from "../components/Publications"

const DownloadCVButton = dynamic(
  () => import("../components/DownloadCVButton"),
  { ssr: false }
)

export default function Home() {
  return (
    <div className="bg-gray-900 min-h-dvh text-white">
      <Profile />
      <Skills />
      <RotatingQuotes />
      <Experience />
      <Publications />
      <Education />
      <DownloadCVButton />
    </div>
  )
}

