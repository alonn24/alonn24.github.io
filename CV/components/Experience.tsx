"use client"

import { useState } from "react"
import { motion, AnimatePresence } from "framer-motion"

const experienceData = {
  timeline: [
    {
      company: "Covver",
      description: "Tailored and custom-branded corporate gift solutions",
      start: "Apr 2022",
      end: "present",
      timeline: [
        {
          title: "R&D Manager",
          start: "Apr 2022",
          end: "present",
          highlights: ["Team Lead", "Growth"],
          description: ["TBD"],
        },
      ],
    },
    {
      company: "Bookaway",
      description:
        "Online platform that simplifies the process of booking travel tickets, including bus, train, ferry, and airport transfer services, across various destinations worldwide",
      start: "Jul 2019",
      end: "Apr 2022",
      timeline: [
        {
          title: "Fullstack Team Lead",
          start: "Nov 2021",
          end: "Apr 2022",
          highlights: ["Team Lead", "Growth", "Cloud"],
          description: [
            "Guiding a team through dynamic environments, prioritizing expansion and adaptability for enhanced scalability.",
            "Creating roadmaps and strategies to align team objectives with organizational goals, ensuring optimal performance and efficiency.",
            "Balancing hands-on development responsibilities with team management duties, ensuring steadfast adherence to best practices and the delivery of consistent quality output.",
            "Overseeing the recruitment process, encompassing candidate assessment, interviewing, and seamless onboarding.",
            "Managing cloud computing environments on Google Cloud Platform (GCP) and transitioning to Amazon Web Services (AWS), while also maintaining a microservices architecture with shared libraries in Node.js.",
          ],
        },
        {
          title: "Software Engineer",
          start: "Jul 2019",
          end: "Nov 2021",
          highlights: ["Startup", "eCommerce", "Travel Industry", "All Around", "Cloud"],
          description: [
            "Working in a startup environment, developing a travel booking platform from scratch, including the frontend, backend, and infrastructure.",
            "Creating end-to-end features, managing services, and handling both backend and frontend development.",
            "Complete eCommerce functionality covering search, booking, cart management, user account features, email notifications, and more.",
            "Orchestrating Kubernetes (k8s) services on Google Cloud Platform (GCP), specifically Google Kubernetes Engine (GKE), employing various technologies such as Elastic Search, Redis, PubSub, and BigQuery.",
            "Implementing performance monitoring through a range of tools including Prometheus with Grafana visualization, New Relic, Datadog, and Coralogix.",
            "Implementing performance and security awareness utilizing a variety of technologies.",
          ],
        },
      ],
    },
    {
      company: "Wix.com",
      description:
        "Cloud-based platform that empowers users to create professional websites and online stores with ease, without requiring any coding skills.",
      start: "Jan 2014",
      end: "Jun 2019",
      timeline: [
        {
          title: "Wix CRM - Site Members Team Lead",
          start: "2018",
          end: "Jun 2019",
          highlights: ["Team Lead", "Cross-functional Team Leadership"],
          description: [
            "Managing teams across different companies while addressing collaboration challenges.",
            "Creating cross-environment features to seamlessly manage members within Wix sites, spanning Wix Back Office (BO), site components, and Wix Code modules.",
            "Implementing role-based authorization and authentication features to regulate user access to site resources effectively.",
            "Providing API exposure (via REST and RPC) for consumers, complete with automatically generated documentation.",
          ],
        },
        {
          title: "Wix ADI - Core Team Software Engineer",
          start: "2016",
          end: "2018",
          highlights: ["Clean Code", "Tech Lead"],
          description: [
            "Creating dynamic pages using G&T algorithm and rendering them with the Wix view renderer.",
            "Employing clean code methodologies, including SOLID principles, Test-Driven Development (TDD), Keep It Simple, Stupid (KISS), You Aren't Gonna Need It (YAGNI), Don't Repeat Yourself (DRY), and other best practices.",
          ],
        },
        {
          title: "Wix Stores - Front End Engineer",
          start: "Jan 2014",
          end: "2016",
          highlights: ["Front-End", "Clean Code", "eCommerce"],
          description: [
            "Developing the front end of an eCommerce funnel utilizing the Angular framework, enriched with 3rd party libraries to craft immersive and dynamic user interfaces.",
            "Creating and managing development environment technologies and build system tools, including Grunt, Bower, and Sass/Compass, to facilitate efficient development workflows.",
            "Practicing clean code principles and Test-Driven Development (TDD) with the support of technologies like Karma, Jasmine, and Protractor to ensure robust and maintainable software development.",
            "Utilizing Git and GitHub for source control management and actively collaborating with the open-source community to contribute and enhance projects.",
            "Monitoring performance and ensuring a lag-free user experience through a range of technologies including New Relic, Raygun.io, TrackJs, and more.",
          ],
        },
      ],
    },
    {
      company: "Mamram",
      description:
        "prestigious computing unit within the Israel Defense Forces (IDF). Mamram serves as the IDF's central computing and information technology unit, responsible for training and developing highly skilled professionals in various fields related to information technology,",
      start: "Mar 2012",
      end: "Jan 2014",
      timeline: [
        {
          title: "BSM (Business Service Management) Design Team Leader",
          start: "Mar 2012",
          end: "Jan 2014",
          highlights: ["Solution Design", "DC Monitoring"],
          description: [
            "Designing and executing the implementation of HP's Business Service Management (BSM) solution, version 9.2, within an IT organization.",
            "Gaining comprehensive knowledge of DC's systems architecture and integrating it within the BSM Platform for streamlined implementation and efficient operations.",
            "Architecting business services and their underlying components, down to the system level, to ensure robust and cohesive design aligned with organizational objectives.",
            "Revamping the availability management strategy, encompassing monitoring and maintenance processes, leveraging BSM alongside complementary systems for enhanced reliability and efficiency.",
          ],
        },
        {
          title: "CM Team Leader",
          start: "Nov 2010",
          end: "Mar 2012",
          highlights: ["Team Lead", "Release Management"],
          description: [
            "Experienced hands-on CM Team Leader adept at overseeing a team of up to four members, guiding them through collaborative efforts to achieve project objectives effectively.",
            "Facilitating seamless integration with affiliated organizations and teams to manage current workflows and strategize future development initiatives effectively.",
            "Implementing segregated development environments and versioning by leveraging source control branches and releases to ensure efficient code management and deployment processes.",
            "Designing and implementing Source Control utilizing Rational ClearCase (versions 6.0 to 7.0) and ClearCase RCC, seamlessly integrated with Visual Studio (2003 to 2010) and Rational Application Developer (versions 7.0 to 9.0) to streamline version control and development workflows.",
            "Developing COM+ applications and implementing automated building systems across diverse environments utilizing VB6.0, Ant building, Microsoft MSBuild, and scripting languages to streamline development processes and ensure consistent build quality.",
            "Maintenance of development environments, encompassing integration with public repositories to facilitate seamless collaboration and version control among team members.",
            "Automating critical processes such as the auto-generation of release components and parallel deployment to multiple environments utilizing batch scripting, Ant build, MSBuild, WSAdmin, and Python scripts for enhanced efficiency and reliability in deployment workflows.",
            "Expertise in middleware maintenance, including proficiency in managing IIS (versions 6.0 and 7.0) and WebSphere (versions 7.0 and 8.1), ensuring optimal performance and reliability of web applications and services.",
          ],
        },
        {
          title: "Software Developer",
          start: "May 2006",
          end: "Mar 2012",
          highlights: ["Configuration Management", "Full Stack"],
          description: [
            "Recipient of the prestigious Mamram Certificate of Excellence in 2010, recognizing outstanding achievement and dedication in the field of technology and innovation.",
            "Front-end development expertise encompassing ASP.NET (versions 1.0 to 3.5), C# (versions 1.0 to 3.0), JavaScript, AJAX, JQuery, SVG, and dynamic drawing. Proficient in Silverlight, HTML5, and CSS3, with a keen focus on creating rich and interactive user experiences.",
            "Integration experience with 3rd party software including Infragistics NetAdvantage, KVM, and Xstream, ensuring seamless interoperability and enhanced functionality within software systems.",
            "Leading a security development team specialized in mitigating cross-site scripting (XSS) and preventing script/SQL injection vulnerabilities, ensuring robust protection of software systems against malicious attacks.",
            "Leading a performance analysis team proficient in conducting memory dump investigations and load tests utilizing HP's LoadRunner and Diagnostics, including VUGen scripting, to optimize system performance and reliability.",
            "Back-end development proficiency in Java (versions 6.0 to 7.0) and Hibernate (version 3.1), ensuring robust and efficient data management and processing capabilities within software applications.",
            "Enterprise system development using SOA architecture.",
          ],
        },
      ],
    },
  ],
}

const Experience = () => {
  const [expandedCompany, setExpandedCompany] = useState<string | null>(null)
  const [expandedRole, setExpandedRole] = useState<string | null>(null)

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
              className="text-2xl font-bold mb-2 cursor-pointer hover:text-red-500 transition-colors"
              onClick={() => setExpandedCompany(expandedCompany === company.company ? null : company.company)}
            >
              {company.company}
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
                      <h4
                        className="text-xl font-semibold mb-2 cursor-pointer hover:text-red-500 transition-colors"
                        onClick={() => setExpandedRole(expandedRole === role.title ? null : role.title)}
                      >
                        {role.title}
                      </h4>
                      <p className="text-gray-400 mb-2">
                        {role.start} - {role.end}
                      </p>
                      <AnimatePresence>
                        {expandedRole === role.title && (
                          <motion.div
                            initial={{ opacity: 0, height: 0 }}
                            animate={{ opacity: 1, height: "auto" }}
                            exit={{ opacity: 0, height: 0 }}
                            transition={{ duration: 0.3 }}
                          >
                            <ul className="list-disc list-inside mb-2">
                              {role.highlights.map((highlight, index) => (
                                <li key={index}>{highlight}</li>
                              ))}
                            </ul>
                            <ul className="list-disc list-inside pl-4">
                              {role.description.map((desc, index) => (
                                <li key={index} className="mb-1">
                                  {desc}
                                </li>
                              ))}
                            </ul>
                          </motion.div>
                        )}
                      </AnimatePresence>
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

