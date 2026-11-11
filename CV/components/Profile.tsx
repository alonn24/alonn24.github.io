"use client"

import { motion, useScroll, useTransform } from "framer-motion"
import { useEffect, useRef, useState } from "react"
import { FaFacebookF, FaInstagram, FaLinkedinIn, FaEnvelope } from "react-icons/fa"

const PROFILE_SRC = "https://alony-public.s3.eu-west-1.amazonaws.com/hero-profile-1794385060607.png"

const Profile = () => {
  const placeholderRef = useRef<HTMLDivElement>(null)
  // Pinned/shrinking behavior only applies from the md breakpoint (768px); below it the image stays in the flow.
  const [pinned, setPinned] = useState(false)
  const start = useRef({ left: 0, top: 0, size: 256, delay: 400, range: 480 })
  const { scrollY } = useScroll()
  // Progress 0..1: nothing happens for the first 50% of a viewport of scroll, then it animates over the next 60%.
  const progress = useTransform(scrollY, (y) => {
    const { delay, range } = start.current
    return Math.min(1, Math.max(0, (y - delay) / range))
  })
  const size = useTransform(progress, (p) => start.current.size * (1 - 0.5 * p))
  const left = useTransform(progress, (p) => start.current.left + (16 - start.current.left) * p)
  const top = useTransform(progress, (p) => start.current.top + (16 - start.current.top) * p)

  // Measure where the image sits in the hero at scroll 0 (and on resize).
  useEffect(() => {
    const measure = () => {
      const isDesktop = window.matchMedia("(min-width: 768px)").matches
      setPinned(isDesktop)
      const el = placeholderRef.current
      if (!isDesktop || !el) return
      const r = el.getBoundingClientRect()
      start.current = {
        left: r.left,
        top: r.top + window.scrollY,
        size: r.width,
        delay: window.innerHeight * 0.5,
        range: window.innerHeight * 0.6,
      }
      scrollY.set(scrollY.get()) // re-run transforms with new start values
    }
    measure()
    window.addEventListener("resize", measure)
    return () => window.removeEventListener("resize", measure)
  }, [scrollY])
  const [videoPlaying, setVideoPlaying] = useState(false)
  const [allowVideo, setAllowVideo] = useState(true)
  const videoRef = useRef<HTMLVideoElement>(null)

  // Skip the video for reduced-motion and data-saver users; the poster image stays.
  useEffect(() => {
    const conn = (navigator as Navigator & { connection?: { saveData?: boolean } }).connection
    if (window.matchMedia("(prefers-reduced-motion: reduce)").matches || conn?.saveData) {
      setAllowVideo(false)
      return
    }
    const video = videoRef.current
    if (!video) return
    // React does not reliably set the muted attribute, which browsers require for autoplay.
    video.muted = true
    video.play().catch(() => {})
    // Cached video may already be playing before hydration attaches onPlaying.
    if (!video.paused && video.readyState >= 3) setVideoPlaying(true)
  }, [])

  return (
    <div
      className="relative overflow-hidden bg-cover bg-center h-screen"
      style={{ backgroundImage: "url('/hero.png')" }}
    >
      {allowVideo && (
        <video
          ref={videoRef}
          className={`absolute inset-0 h-full w-full object-cover transition-opacity duration-700 ${
            videoPlaying ? "opacity-100" : "opacity-0"
          }`}
          src="https://alony-public.s3.eu-west-1.amazonaws.com/hero-loop-1794385060607.mp4"
          autoPlay
          muted
          loop
          playsInline
          preload="auto"
          aria-hidden="true"
          onPlaying={() => setVideoPlaying(true)}
        />
      )}
      <div className="absolute inset-0 bg-black bg-opacity-60"></div>
      <div className="container mx-auto px-4 h-full flex items-center relative z-10">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 items-center">
          <div ref={placeholderRef} className="w-64 h-64 mx-auto md:mx-0">
            {!pinned && (
              <img src={PROFILE_SRC} alt="Alon Yehezkel" className="rounded-full w-full h-full object-cover" />
            )}
          </div>
          {pinned && (
            <motion.img
              src={PROFILE_SRC}
              alt="Alon Yehezkel"
              className="fixed z-50 rounded-full object-cover"
              style={{ left, top, width: size, height: size }}
            />
          )}
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
              Engineering Leader
            </motion.h2>
            <motion.p
              className="text-lg mb-6"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.5, delay: 0.4 }}
            >
              I've been building software for almost 20 years: first as an IDF Mamram officer, then at Wix, Bookaway and Covver. I've worked as a front-end and full-stack engineer, a team lead and an engineering manager. Lately most of my work happens with AI coding agents, and I look for the simplest solution that works. I'm a father of two, trained in NLP and brain-based coaching, and I'm open to senior engineering roles.
            </motion.p>
            <motion.div
              className="mb-6"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.5, delay: 0.5 }}
            >
              <a
                href="https://www.linkedin.com/in/alonn24/"
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 rounded-full border border-red-500 px-6 py-2 text-sm font-semibold text-red-400 transition-colors hover:border-red-400 hover:text-red-300"
              >
                <FaLinkedinIn size={16} />
                View my LinkedIn profile
              </a>
            </motion.div>
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

