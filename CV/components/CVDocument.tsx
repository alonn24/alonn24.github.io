"use client"

import {
  Document,
  Page,
  Text,
  View,
  Link,
  Image,
  StyleSheet,
} from "@react-pdf/renderer"
import { experienceData } from "@/data/experienceData"
import { educationData } from "@/data/educationData"
import { publicationsData } from "@/data/publicationsData"
import { stripHtml, pdfBulletText } from "@/lib/pdfUtils"

// Optional: register a font for a more polished look (default Helvetica is fine for CV)
// Font.register({ family: 'Inter', src: '/fonts/Inter-Regular.ttf' })

const styles = StyleSheet.create({
  page: {
    paddingTop: 36,
    paddingBottom: 36,
    paddingHorizontal: 40,
    fontFamily: "Helvetica",
    fontSize: 10,
  },
  profilePage: {
    paddingTop: 36,
    paddingBottom: 36,
    paddingHorizontal: 40,
    fontFamily: "Helvetica",
    fontSize: 10,
    flexDirection: "column",
  },
  profileTopHalf: {
    minHeight: 160,
    justifyContent: "center",
    alignItems: "center",
    marginBottom: 8,
  },
  profileImageLarge: {
    width: 120,
    height: 120,
    borderRadius: 60,
    objectFit: "cover",
  },
  profileBottomHalf: {
    minHeight: 100,
    justifyContent: "flex-start",
  },
  profileSectionHeading: {
    fontSize: 14,
    fontWeight: "bold",
    color: "#b91c1c",
    marginTop: 12,
    marginBottom: 6,
    textTransform: "uppercase",
    letterSpacing: 0.5,
    textAlign: "center",
  },
  experienceSummaryCompany: {
    fontSize: 10,
    fontWeight: "bold",
    color: "#1a1a1a",
    marginTop: 6,
    marginBottom: 2,
  },
  experienceSummaryRole: {
    fontSize: 9,
    color: "#6b7280",
    marginLeft: 8,
    marginBottom: 2,
  },
  profileTwoColRow: {
    flexDirection: "row",
    marginTop: 4,
    alignItems: "flex-start",
  },
  profileCol: {
    flex: 0.5,
    paddingRight: 12,
    minWidth: 0,
  },
  profileColRight: {
    flex: 0.5,
    paddingLeft: 8,
    minWidth: 0,
  },
  educationSummaryOrg: {
    fontSize: 10,
    fontWeight: "bold",
    color: "#1a1a1a",
    marginTop: 6,
    marginBottom: 2,
  },
  educationSummaryTitle: {
    fontSize: 9,
    color: "#374151",
    marginLeft: 8,
    marginBottom: 2,
  },
  educationSummaryDate: {
    fontSize: 9,
    color: "#6b7280",
    marginLeft: 8,
    marginBottom: 2,
  },
  title: {
    fontSize: 24,
    fontWeight: "bold",
    marginBottom: 6,
    color: "#1a1a1a",
    textAlign: "center",
  },
  subtitle: {
    fontSize: 14,
    fontWeight: "bold",
    color: "#b91c1c",
    marginBottom: 12,
    textAlign: "center",
  },
  profileBody: {
    color: "#374151",
    lineHeight: 1.5,
    fontSize: 11,
    textAlign: "center",
  },
  body: {
    color: "#374151",
    lineHeight: 1.4,
    fontSize: 10,
  },
  sectionHeading: {
    fontSize: 24,
    fontWeight: "bold",
    color: "#b91c1c",
    marginTop: 14,
    marginBottom: 8,
    textTransform: "uppercase",
    letterSpacing: 0.5,
    textAlign: "center",
  },
  companyHeader: {
    marginBottom: 12,
  },
  companyName: {
    fontSize: 18,
    fontWeight: "bold",
    color: "#1a1a1a",
    marginBottom: 4,
  },
  roleBlock: {
    backgroundColor: "#ffffff",
    padding: 16,
    marginBottom: 14,
    borderLeftWidth: 4,
    borderLeftColor: "#b91c1c",
  },
  roleTitle: {
    fontSize: 20,
    fontWeight: "bold",
    color: "#b91c1c",
    marginTop: 8,
    marginBottom: 0,
  },
  roleDateRange: {
    fontSize: 9,
    color: "#6b7280",
    marginTop: 2,
    marginBottom: 6,
  },
  roleSubheading: {
    fontSize: 9,
    fontWeight: "bold",
    color: "#b91c1c",
    marginTop: 4,
    marginBottom: 4,
    textTransform: "uppercase",
    letterSpacing: 0.3,
  },
  dateRange: {
    fontSize: 9,
    color: "#6b7280",
    marginBottom: 4,
  },
  bulletList: {
    marginLeft: 0,
    marginBottom: 10,
  },
  bulletItem: {
    marginBottom: 4,
    paddingLeft: 0,
    lineHeight: 1.4,
  },
  bulletText: {
    color: "#374151",
    fontSize: 9,
    lineHeight: 1.4,
  },
  roleRow: {
    flexDirection: "row",
    marginBottom: 12,
    alignItems: "flex-start",
  },
  roleLeftCol: {
    flex: 0.6,
    marginRight: 16,
    minWidth: 0,
  },
  roleRightCol: {
    flex: 0.3,
    minWidth: 0,
  },
  tag: {
    backgroundColor: "#f3f4f6",
    color: "#374151",
    paddingHorizontal: 6,
    paddingVertical: 2,
    marginRight: 4,
    marginBottom: 4,
    fontSize: 8,
  },
  link: {
    color: "#2563eb",
    fontSize: 9,
    marginBottom: 2,
  },
  profileLinksRow: {
    flexDirection: "row",
    flexWrap: "wrap",
    alignItems: "center",
    justifyContent: "center",
    marginTop: 12,
  },
  profileLinkInline: {
    fontSize: 9,
    color: "#2563eb",
  },
  profileLinkSeparator: {
    fontSize: 9,
    color: "#374151",
    marginHorizontal: 6,
  },
})

type CVDocumentProps = {
  profileImageUrl?: string
}

export default function CVDocument({ profileImageUrl }: CVDocumentProps) {
  const skills = experienceData.skills.filter(Boolean)

  return (
    <Document>
      {/* Page 1: Profile only – image top half, description bottom half */}
      <Page size="A4" style={styles.profilePage}>
        <View style={styles.profileTopHalf}>
          {profileImageUrl ? (
            <Image src={profileImageUrl} style={styles.profileImageLarge} />
          ) : null}
        </View>
        <View style={styles.profileBottomHalf}>
          <Text style={styles.title}>Alon Yehezkel</Text>
          <Text style={styles.subtitle}>Software Engineer</Text>
          <Text style={styles.profileBody}>
            A husband, a father and a Software Developer. A Mamram Graduate IDF Captain officer, experienced in the
            industry including code development, testing, integration and service management within an IT organization.
          </Text>
          <View style={styles.profileLinksRow}>
            {publicationsData.map((pub, i) => (
              <View key={pub.platform} style={{ flexDirection: "row", alignItems: "center" }}>
                {i > 0 && <Text style={styles.profileLinkSeparator}>|</Text>}
                <Link src={pub.url} style={styles.profileLinkInline}>
                  {pub.platform}
                </Link>
              </View>
            ))}
            {publicationsData.length > 0 && <Text style={styles.profileLinkSeparator}>|</Text>}
            <Link src="https://twitter.com/alonn24" style={styles.profileLinkInline}>
              Twitter
            </Link>
            <Text style={styles.profileLinkSeparator}>|</Text>
            <Link src="https://www.instagram.com/alonn24/" style={styles.profileLinkInline}>
              Instagram
            </Link>
            <Text style={styles.profileLinkSeparator}>|</Text>
            <Link src="https://www.linkedin.com/in/alonn24/" style={styles.profileLinkInline}>
              LinkedIn
            </Link>
            <Text style={styles.profileLinkSeparator}>|</Text>
            <Link src="https://www.facebook.com/alon.yehezkel.1/" style={styles.profileLinkInline}>
              Facebook
            </Link>
            <Text style={styles.profileLinkSeparator}>|</Text>
            <Link src="mailto:alonn24@gmail.com" style={styles.profileLinkInline}>
              Email
            </Link>
          </View>
        </View>

        <Text style={styles.profileSectionHeading}>Skills</Text>
        <View style={{ flexDirection: "row", flexWrap: "wrap", marginBottom: 4 }}>
          {skills.map((skill, i) => (
            <Text key={i} style={styles.tag}>
              {skill}
            </Text>
          ))}
        </View>

        <View style={styles.profileTwoColRow}>
          <View style={styles.profileCol}>
            <Text style={styles.profileSectionHeading}>Experience</Text>
            {experienceData.timeline.map((company) => (
              <View key={company.company}>
                <Text style={styles.experienceSummaryCompany}>{company.company}</Text>
                {company.timeline.map((role) => (
                  <Text key={role.title} style={styles.experienceSummaryRole}>
                    {role.title} — {role.start} – {role.end}
                  </Text>
                ))}
              </View>
            ))}
          </View>
          <View style={styles.profileColRight}>
            <Text style={styles.profileSectionHeading}>Education</Text>
            {educationData.timeline.map((edu) => (
              <View key={edu.organization}>
                <Text style={styles.educationSummaryOrg}>{edu.organization}</Text>
                <Text style={styles.educationSummaryTitle}>{edu.title}</Text>
                <Text style={styles.educationSummaryDate}>
                  {edu.start === edu.end ? edu.start : `${edu.start} – ${edu.end}`}
                </Text>
              </View>
            ))}
          </View>
        </View>
      </Page>

      {/* Page 2: Experience (detail) */}
      <Page size="A4" style={styles.page}>
        <Text style={styles.sectionHeading}>Experience</Text>
        {experienceData.timeline.map((company) => (
          <View key={company.company} style={{ marginBottom: 20 }}>
            <View style={styles.companyHeader}>
              <Text style={styles.companyName}>{company.company}</Text>
              <Text style={styles.dateRange}>
                {company.start} – {company.end}
              </Text>
              <Text style={[styles.body, { marginBottom: 0 }]}>{company.description}</Text>
            </View>
            {company.timeline.map((role) => (
              <View key={role.title} style={styles.roleBlock}>
                <Text style={styles.roleTitle}>{role.title}</Text>
                <Text style={styles.roleDateRange}>
                  {role.start} – {role.end}
                </Text>
                {role.skills && role.skills.length > 0 && (
                  <View style={{ flexDirection: "row", flexWrap: "wrap", marginBottom: 6 }}>
                    {role.skills.map((s, i) => (
                      <Text key={i} style={styles.tag}>
                        {s}
                      </Text>
                    ))}
                  </View>
                )}
                <View style={styles.roleRow}>
                  <View style={styles.roleLeftCol}>
                    {role.impact && role.impact.length > 0 && (
                      <View>
                        <Text style={styles.roleSubheading}>Impact</Text>
                        <View style={styles.bulletList}>
                          {role.impact.map((item, i) => (
                            <View key={i} style={styles.bulletItem}>
                              <Text style={styles.bulletText}>• {pdfBulletText(item)}</Text>
                            </View>
                          ))}
                        </View>
                      </View>
                    )}
                    {role.responsibilities && role.responsibilities.length > 0 && (
                      <View>
                        <Text style={styles.roleSubheading}>Responsibilities</Text>
                        <View style={styles.bulletList}>
                          {role.responsibilities.map((item, i) => (
                            <View key={i} style={styles.bulletItem}>
                              <Text style={styles.bulletText}>• {pdfBulletText(item)}</Text>
                            </View>
                          ))}
                        </View>
                      </View>
                    )}
                  </View>
                  <View style={styles.roleRightCol}>
                    {role.techStack && role.techStack.length > 0 ? (
                      <View>
                        <Text style={styles.roleSubheading}>Tech Stack</Text>
                        <View style={{ flexDirection: "row", flexWrap: "wrap", marginTop: 2 }}>
                          {role.techStack.map((tech, i) => (
                            <Text key={i} style={styles.tag}>
                              {tech}
                            </Text>
                          ))}
                        </View>
                      </View>
                    ) : null}
                  </View>
                </View>
              </View>
            ))}
          </View>
        ))}
      </Page>
    </Document>
  )
}
