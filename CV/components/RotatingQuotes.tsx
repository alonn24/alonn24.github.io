"use client"

import { useState, useEffect } from "react"
import { motion, AnimatePresence } from "framer-motion"

const sentences = [
  "Keep pursuing knowledge, for life is an endless teacher.",
  "Always seek new knowledge, as life's lessons are perpetual.",
  "Embrace lifelong learning, as life is an eternal educator.",
  "Stay committed to learning, for life's teachings are constant.",
  "Never cease learning, as life's lessons are unending.",
  "Maintain a thirst for knowledge, as life's wisdom is infinite.",
  "Keep expanding your horizons, for life's education is ongoing.",
  "Embrace continuous learning, as life never stops imparting wisdom.",
  "Stay curious and open-minded, for life is a perpetual source of learning.",
  "Commit to lifelong growth, as life's lessons are never-ending.",
]

const RotatingQuotes = () => {
  const [currentQuote, setCurrentQuote] = useState(0)

  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentQuote((prev) => (prev + 1) % sentences.length)
    }, 5000) // Change quote every 5 seconds

    return () => clearInterval(interval)
  }, [])

  return (
    <div className="bg-red-600 py-12 relative overflow-hidden">
      <div className="container mx-auto px-4">
        <AnimatePresence mode="wait">
          <motion.div
            key={currentQuote}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -20 }}
            transition={{ duration: 0.5 }}
            className="text-center text-white text-2xl font-bold italic"
          >
            {sentences[currentQuote]}
          </motion.div>
        </AnimatePresence>
      </div>
      <div className="absolute top-0 left-0 w-full h-full opacity-10">
        <div className="w-full h-full bg-[url('/comic-pattern.png')] bg-repeat"></div>
      </div>
    </div>
  )
}

export default RotatingQuotes

