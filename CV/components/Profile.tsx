"use client"

import { motion } from "framer-motion"
import { useState } from "react"
import { FaFacebookF, FaInstagram, FaLinkedinIn, FaEnvelope } from "react-icons/fa"

const Profile = () => {
  const [isHovered, setIsHovered] = useState(false)

  return (
    <div
      className="relative overflow-hidden bg-cover bg-center h-screen"
      style={{ backgroundImage: "url('/hero.png')" }}
    >
      <div className="absolute inset-0 bg-black bg-opacity-60"></div>
      <div className="container mx-auto px-4 h-full flex items-center relative z-10">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 items-center">
          <motion.div
            className="relative w-64 h-64 mx-auto md:mx-0"
            whileHover={{ scale: 1.05 }}
            onHoverStart={() => setIsHovered(true)}
            onHoverEnd={() => setIsHovered(false)}
          >
            <motion.img
              src="/profile.png"
              alt="Alon Yehezkel"
              className="rounded-full w-full h-full object-cover"
              animate={isHovered ? { rotate: 360 } : {}}
              transition={{ duration: 2, ease: "linear" }}
            />
            {isHovered && (
              <motion.div
                className="absolute inset-0 bg-red-600 bg-opacity-50 rounded-full flex items-center justify-center"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
              >
                <span className="text-white text-2xl font-bold">Alon Yehezkel</span>
              </motion.div>
            )}
          </motion.div>
          <div>
            <motion.h1
              className="text-4xl md:text-6xl font-extrabold mb-4"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.5 }}
            >
              Alon Yehezkel
            </motion.h1>
            <motion.h2
              className="text-2xl md:text-3xl font-bold mb-4 text-red-500"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.5, delay: 0.2 }}
            >
              Software Engineer
            </motion.h2>
            <motion.p
              className="text-lg mb-6"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.5, delay: 0.4 }}
            >
              A husband, a father and a Software Developer. A Mamram Graduate IDF Captain officer, experienced in the
              industry including code development, testing, integration and service management within an IT
              organization.
            </motion.p>
            <motion.div
              className="flex space-x-4"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.5, delay: 0.6 }}
            >
              <a
                href="https://www.facebook.com/alon.yehezkel.1/"
                target="_blank"
                rel="noopener noreferrer"
                className="text-white hover:text-red-500 transition-colors"
              >
                <FaFacebookF size={24} />
              </a>
              <a
                href="https://www.instagram.com/alonn24/"
                target="_blank"
                rel="noopener noreferrer"
                className="text-white hover:text-red-500 transition-colors"
              >
                <FaInstagram size={24} />
              </a>
              <a
                href="https://www.linkedin.com/in/alonn24/"
                target="_blank"
                rel="noopener noreferrer"
                className="text-white hover:text-red-500 transition-colors"
              >
                <FaLinkedinIn size={24} />
              </a>
              <a href="mailto:alonn24@gmail.com" className="text-white hover:text-red-500 transition-colors">
                <FaEnvelope size={24} />
              </a>
            </motion.div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Profile

