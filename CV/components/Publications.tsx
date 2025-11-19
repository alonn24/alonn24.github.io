"use client"

import Link from "next/link"
import { motion } from "framer-motion"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { publicationsData } from "@/data/publicationsData"

const Publications = () => {
  return (
    <div className="container mx-auto px-4 py-16">
      <h2 className="text-4xl font-bold mb-8 text-center text-red-500">Publications</h2>
      <div className="mb-12 text-center">
        <Link
          href="/publications"
          className="inline-flex items-center rounded-full border border-red-500 px-6 py-2 text-sm font-semibold text-red-400 transition-colors hover:border-red-400 hover:text-red-300"
        >
          View All Publications
        </Link>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        {publicationsData.map((pub, index) => (
          <motion.div
            key={pub.platform}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5, delay: index * 0.1 }}
          >
            <a
              href={pub.url}
              target="_blank"
              rel="noopener noreferrer"
              className="block transition-transform hover:scale-105"
            >
              <Card className="bg-gray-800 border-none">
                <CardHeader>
                  <CardTitle className="flex items-center gap-2 text-2xl">
                    <pub.icon className="text-red-500" size={24} />
                    <span className="text-white">{pub.platform}</span>
                  </CardTitle>
                </CardHeader>
                <CardContent>
                  <CardDescription className="text-gray-400">{pub.description}</CardDescription>
                </CardContent>
              </Card>
            </a>
          </motion.div>
        ))}
      </div>
    </div>
  )
}

export default Publications

