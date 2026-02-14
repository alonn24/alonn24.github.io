"use client"

import { useState, useRef } from "react"
import { motion, AnimatePresence } from "framer-motion"
import { FaChevronDown } from "react-icons/fa"
import { experienceData } from "@/data/experienceData"

const EXIT_DURATION_MS = 300
const ENTER_DURATION_MS = 300

const Experience = () => {
  const [expandedCompany, setExpandedCompany] = useState<string | null>(null)
  const cardRefs = useRef<Record<string, HTMLDivElement | null>>({})

  const scrollCardToTop = (companyName: string) => {
    const el = cardRefs.current[companyName]
    if (el) {
      const y = el.getBoundingClientRect().top + window.scrollY
      window.scrollTo({ top: y, left: 0, behavior: "instant" })
    }
  }

  const handleCompanyClick = (companyName: string) => {
    if (expandedCompany === companyName) {
      setExpandedCompany(null)
      return
    }
    if (expandedCompany !== null) {
      // 1. Close current section
      setExpandedCompany(null)
      // 2. After close animation, scroll instantly then open so no competing scroll
      setTimeout(() => {
        scrollCardToTop(companyName)
        requestAnimationFrame(() => {
          setExpandedCompany(companyName)
          // 3. Re-pin card to top after expand animation (prevents scroll-anchor jump)
          setTimeout(() => scrollCardToTop(companyName), ENTER_DURATION_MS)
        })
      }, EXIT_DURATION_MS)
    } else {
      scrollCardToTop(companyName)
      requestAnimationFrame(() => {
        setExpandedCompany(companyName)
        setTimeout(() => scrollCardToTop(companyName), ENTER_DURATION_MS)
      })
    }
  }

  return (
    <div className="container mx-auto px-4 py-16">
      <h2 className="text-4xl font-bold mb-8 text-center text-red-500">Experience</h2>
      <div className="space-y-8">
        {experienceData.timeline.map((company, index) => (
          <motion.div
            key={company.company}
            ref={(el) => {
              cardRefs.current[company.company] = el
            }}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5, delay: index * 0.1 }}
            className="bg-gray-800 rounded-lg p-6 shadow-lg"
          >
            <h3
              className="text-2xl font-bold mb-2 cursor-pointer hover:text-red-500 transition-colors flex items-center justify-between"
              onClick={() => handleCompanyClick(company.company)}
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
                  style={{ overflowAnchor: "none" }}
                >
                  <p className="mb-4">{company.description}</p>
                  {company.timeline.map((role, roleIndex) => (
                    <div
                      key={role.title}
                      className={`mb-4 ${roleIndex > 0 ? "border-t border-gray-700 pt-4" : ""}`}
                    >
                      <h4 className="text-xl font-semibold mb-2 text-red-500">{role.title}</h4>
                      <p className="text-gray-400 mb-2">
                        {role.start} - {role.end}
                      </p>
                      {role.skills?.length > 0 && (
                        <div className="flex flex-wrap gap-2 mb-2">
                          {role.skills.map((skill, i) => (
                            <span
                              key={i}
                              className="bg-gray-700 text-gray-300 px-2 py-1 rounded text-sm border border-gray-600"
                            >
                              {skill}
                            </span>
                          ))}
                        </div>
                      )}
                      {role.impact && role.impact.length > 0 && (
                        <>
                          <h5 className="text-base font-bold text-red-500 mt-3 mb-2 uppercase tracking-wide">
                            Impact
                          </h5>
                          <ul className="list-none pl-0 mb-2 space-y-1.5">
                            {role.impact.map((item, i) => (
                              <li key={i} className="text-gray-300" dangerouslySetInnerHTML={{ __html: item }} />
                            ))}
                          </ul>
                        </>
                      )}
                      {role.responsibilities && role.responsibilities.length > 0 && (
                        <>
                          <h5 className="text-base font-bold text-red-500 mt-3 mb-2 uppercase tracking-wide">
                            Responsibilities
                          </h5>
                          <ul className="list-none pl-0 mb-2 space-y-1.5">
                            {role.responsibilities.map((item, i) => (
                              <li key={i} className="text-gray-300" dangerouslySetInnerHTML={{ __html: item }} />
                            ))}
                          </ul>
                        </>
                      )}
                      {role.techStack && role.techStack.length > 0 && (
                        <>
                          <h5 className="text-base font-bold text-red-500 mt-3 mb-2 uppercase tracking-wide">
                            Tech Stack
                          </h5>
                          <div className="flex flex-wrap gap-2 mt-2">
                            {role.techStack.map((tech, i) => (
                              <span
                                key={i}
                                className="bg-gray-700 text-gray-300 px-2 py-1 rounded text-sm border border-gray-600"
                              >
                                {tech}
                              </span>
                            ))}
                          </div>
                        </>
                      )}
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
