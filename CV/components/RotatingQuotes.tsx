"use client"

import { useState, useEffect } from "react"
import { motion, AnimatePresence } from "framer-motion"
import { sentences } from "@/data/rotatingQuotesData"

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

