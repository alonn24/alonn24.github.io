"use client"

import { useState, useEffect } from "react"

export default function ScrollProgress() {
  const [progress, setProgress] = useState(0)

  useEffect(() => {
    const handleScroll = () => {
      const { scrollTop, scrollHeight, clientHeight } = document.documentElement
      const total = scrollHeight - clientHeight
      const percent = total > 0 ? (scrollTop / total) * 100 : 0
      setProgress(percent)
    }

    handleScroll()
    window.addEventListener("scroll", handleScroll, { passive: true })
    return () => window.removeEventListener("scroll", handleScroll)
  }, [])

  return (
    <div
      className="fixed left-0 right-0 top-0 z-[9999] h-[5px] bg-transparent"
      role="progressbar"
      aria-valuenow={Math.round(progress)}
      aria-valuemin={0}
      aria-valuemax={100}
    >
      <div
        className="h-full bg-red-500 transition-[width] duration-75 ease-out"
        style={{ width: `${progress}%` }}
      />
    </div>
  )
}
