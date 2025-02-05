import Profile from "../components/Profile"
import Experience from "../components/Experience"
import Education from "../components/Education"
import RotatingQuotes from "../components/RotatingQuotes"

export default function Home() {
  return (
    <div className="bg-gray-900 min-h-screen text-white">
      <Profile />
      <RotatingQuotes />
      <Experience />
      <Education />
    </div>
  )
}

