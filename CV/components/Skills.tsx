"use client"

import { motion } from "framer-motion"
import { experienceData } from "@/data/experienceData"

const Skills = () => {
  const skills = experienceData.skills.filter(Boolean)

  return (
    <div className="container mx-auto px-4 py-16">
      <h2 className="text-4xl font-bold mb-8 text-center text-red-500">Skills</h2>
      <motion.div
        className="flex flex-wrap gap-2 justify-center"
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
      >
        {skills.map((skill) => (
          <span
            key={skill}
            className="bg-gray-800 text-gray-200 px-3 py-1.5 rounded-full text-sm border border-gray-700 hover:border-red-500/50 transition-colors"
          >
            {skill}
          </span>
        ))}
      </motion.div>
    </div>
  )
}

export default Skills
