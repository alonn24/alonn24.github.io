"use client"

import { motion } from "framer-motion"
import { educationData } from "@/data/educationData"

const Education = () => {
  return (
    <div className="container mx-auto px-4 py-16">
      <h2 className="text-4xl font-bold mb-8 text-center text-red-500">Education</h2>
      <div className="space-y-8">
        {educationData.timeline.map((edu, index) => (
          <motion.div
            key={edu.organization}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5, delay: index * 0.1 }}
            className="bg-gray-800 rounded-lg p-6 shadow-lg"
          >
            <h3 className="text-2xl font-bold mb-2">{edu.organization}</h3>
            <p className="text-xl mb-2">{edu.title}</p>
            <p className="text-gray-400">
              {edu.start} - {edu.end}
            </p>
          </motion.div>
        ))}
      </div>
    </div>
  )
}

export default Education

