"use client"

import { useState } from "react"
import { motion, AnimatePresence } from "framer-motion"
import { FaChevronDown } from "react-icons/fa"
import { experienceData } from "@/data/experienceData"

const Experience = () => {
  const [expandedCompany, setExpandedCompany] = useState<string | null>(null)

  return (
    <div className="container mx-auto px-4 py-16">
      <h2 className="text-4xl font-bold mb-8 text-center text-red-500">Experience</h2>
      <div className="space-y-8">
        {experienceData.timeline.map((company, index) => (
          <motion.div
            key={company.company}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5, delay: index * 0.1 }}
            className="bg-gray-800 rounded-lg p-6 shadow-lg"
          >
            <h3
              className="text-2xl font-bold mb-2 cursor-pointer hover:text-red-500 transition-colors flex items-center justify-between"
              onClick={() => setExpandedCompany(expandedCompany === company.company ? null : company.company)}
            >
              <span className="flex items-center gap-2">
                <img
                  src={company.logo || "/placeholder.svg"}
                  alt={`${company.company} logo`}
                  className="w-6 h-6 object-contain"
                />
                {company.company}
              </span>
              <FaChevronDown
                className={`transition-transform duration-300 ${
                  expandedCompany === company.company ? "transform rotate-180" : ""
                }`}
              />
            </h3>
            <p className="text-gray-400 mb-2">
              {company.start} - {company.end}
            </p>
            <AnimatePresence>
              {expandedCompany === company.company && (
                <motion.div
                  initial={{ opacity: 0, height: 0 }}
                  animate={{ opacity: 1, height: "auto" }}
                  exit={{ opacity: 0, height: 0 }}
                  transition={{ duration: 0.3 }}
                >
                  <p className="mb-4">{company.description}</p>
                  {company.timeline.map((role, roleIndex) => (
                    <div key={role.title} className="mb-4">
                      <h4 className="text-xl font-semibold mb-2 text-red-500">{role.title}</h4>
                      <p className="text-gray-400 mb-2">
                        {role.start} - {role.end}
                      </p>
                      <div>
                        <div className="flex flex-wrap gap-2 mb-2">
                          {role.highlights.map((highlight, index) => (
                            <span key={index} className="bg-red-500 text-white px-2 py-1 rounded-full text-sm">
                              {highlight}
                            </span>
                          ))}
                        </div>
                        <ul className="list-disc list-inside pl-4">
                          {role.description.map((desc, index) => (
                            <li key={index} className="mb-1">
                              {desc}
                            </li>
                          ))}
                        </ul>
                      </div>
                    </div>
                  ))}
                </motion.div>
              )}
            </AnimatePresence>
          </motion.div>
        ))}
      </div>
    </div>
  )
}

export default Experience

