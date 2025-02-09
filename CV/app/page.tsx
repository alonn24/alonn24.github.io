import Profile from "../components/Profile"
import Experience from "../components/Experience"
import Education from "../components/Education"
import RotatingQuotes from "../components/RotatingQuotes"
import Publications from "../components/Publications"

export default function Home() {
  return (
    <div className="bg-gray-900 min-h-dvh text-white">
      <Profile />
      <RotatingQuotes />
      <Experience />
      <Publications />
      <Education />
    </div>
  )
}

