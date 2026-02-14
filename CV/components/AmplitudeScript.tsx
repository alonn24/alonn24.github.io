"use client"

import Script from "next/script"

export default function AmplitudeScript() {
  if (process.env.NODE_ENV !== "production") {
    return null
  }

  return (
    <Script
      id="amplitude-sdk"
      src="https://cdn.amplitude.com/script/8e306da644ba4745685cc1410d1256cf.js"
      strategy="afterInteractive"
      onLoad={() => {
        if (typeof window !== "undefined" && window.amplitude) {
          if (window.sessionReplay?.plugin) {
            window.amplitude.add(window.sessionReplay.plugin({ sampleRate: 1 }))
          }
          window.amplitude.init("8e306da644ba4745685cc1410d1256cf", {
            fetchRemoteConfig: true,
            autocapture: {
              attribution: true,
              fileDownloads: true,
              formInteractions: true,
              pageViews: true,
              sessions: true,
              elementInteractions: true,
              networkTracking: true,
              webVitals: true,
              frustrationInteractions: {
                thrashedCursor: true,
                errorClicks: true,
                deadClicks: true,
                rageClicks: true,
              },
            },
          })
        }
      }}
    />
  )
}
