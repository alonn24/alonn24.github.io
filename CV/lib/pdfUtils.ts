/** Strip HTML tags and decode common entities for plain-text PDF content. */
export function stripHtml(html: string): string {
  return html
    .replace(/<strong>(.*?)<\/strong>/gi, "$1")
    .replace(/<[^>]+>/g, "")
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&quot;/g, '"')
    .trim()
}

/** Remove emoji and symbols that can break PDF layout/rendering. */
export function stripEmoji(text: string): string {
  return text
    .replace(/[\u{1F300}-\u{1F9FF}]/gu, "") // Misc Symbols and Pictographs, Emoticons, etc.
    .replace(/[\u{2600}-\u{26FF}]/gu, "")   // Misc symbols
    .replace(/[\u{2700}-\u{27BF}]/gu, "")  // Dingbats
    .replace(/[\u{2300}-\u{23FF}]/gu, "")   // Misc technical (e.g. ⚡)
    .replace(/[\u{2B50}\u{2728}\u{2734}\u{2744}\u{2747}\u{274C}\u{274E}\u{2753}-\u{2755}\u{2757}\u{2763}\u{2764}\u{2795}-\u{2797}\u{27A1}\u{27B0}\u{27BF}\u{2934}\u{2935}\u{2B05}-\u{2B07}\u{2B1B}\u{2B1C}\u{2B55}\u{3030}\u{303D}\u{3297}\u{3299}]/gu, "")
    .replace(/\s+/g, " ")
    .trim()
}

/** Plain text for PDF bullets: no HTML, no emoji. */
export function pdfBulletText(html: string): string {
  return stripEmoji(stripHtml(html))
}
