"use client"

import { useState } from "react"

const FILENAME = "Alon-Yehezkel-CV.pdf"

export default function DownloadCVButton() {
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const handleDownload = async () => {
    setLoading(true)
    setError(null)
    try {
      const [{ pdf }, { default: CVDocument }] = await Promise.all([
        import("@react-pdf/renderer"),
        import("@/components/CVDocument"),
      ])
      const profileImageUrl =
        typeof window !== "undefined" ? `${window.location.origin}/profile.png` : undefined
      const blob = await pdf(<CVDocument profileImageUrl={profileImageUrl} />).toBlob()
      const url = URL.createObjectURL(blob)
      const a = document.createElement("a")
      a.href = url
      a.download = FILENAME
      a.click()
      URL.revokeObjectURL(url)
    } catch (e) {
      setError(e instanceof Error ? e.message : "Failed to generate PDF")
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="container mx-auto px-4 py-16 text-center">
      <button
        type="button"
        onClick={handleDownload}
        disabled={loading}
        className="inline-flex items-center gap-2 rounded-lg border-2 border-red-500 bg-red-500 px-6 py-3 text-base font-semibold text-white transition-colors hover:bg-red-600 hover:border-red-600 disabled:opacity-60 disabled:cursor-not-allowed"
      >
        {loading ? (
          <>
            <span className="inline-block h-4 w-4 animate-spin rounded-full border-2 border-white border-t-transparent" />
            Generating PDF…
          </>
        ) : (
          <>
            <svg
              className="h-5 w-5"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
              aria-hidden
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={2}
                d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
              />
            </svg>
            Download CV (PDF)
          </>
        )}
      </button>
      {error && (
        <p className="mt-3 text-sm text-red-400" role="alert">
          {error}
        </p>
      )}
    </div>
  )
}
