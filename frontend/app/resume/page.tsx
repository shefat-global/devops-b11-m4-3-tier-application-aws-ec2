"use client";

import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { motion } from "framer-motion";
import { Badge } from "@/components/ui/badge";
import { GraduationCap, Briefcase, Code2, User } from "lucide-react";
import Container from "@/components/Container";
import { useEffect, useMemo, useState } from "react";

interface ResumeDescription {
  type: string;
  value: string;
  id: string;
}

interface ResumeItem {
  id: number;
  title: string;
  sub_title: string;
  description: ResumeDescription[];
  category_titles: string[];
  resume_tag_titles: string[];
  language_tag_titles: string[];
}

interface ResumeResponse {
  title: string;
  resume_items: ResumeItem[];
}

const tabMenu = [
  { title: "Experience", value: "experience", icon: Briefcase },
  { title: "Education", value: "education", icon: GraduationCap },
  { title: "Skills", value: "skills", icon: Code2 },
  { title: "About me", value: "about", icon: User },
];

export default function ResumePage() {
  const [resumeData, setResumeData] = useState<ResumeResponse | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchResumeData = async () => {
      try {
        const response = await fetch("http://127.0.0.1:8000/api/v2/pages/5/");

        if (!response.ok) {
          throw new Error(`Failed to fetch resume data: ${response.status}`);
        }

        const data = await response.json();

        setResumeData({
          title: data.title,
          resume_items: data.resume_items,
        });
      } catch (err) {
        console.error("Error loading resume data:", err);
        setError("Error loading resume data");
      } finally {
        setLoading(false);
      }
    };

    fetchResumeData();
  }, []);

  const experienceItems = useMemo(
    () =>
      resumeData?.resume_items.filter((item) =>
        item.category_titles.includes("Experience")
      ) || [],
    [resumeData]
  );

  const educationItems = useMemo(
    () =>
      resumeData?.resume_items.filter((item) =>
        item.category_titles.includes("Education")
      ) || [],
    [resumeData]
  );

  const skillItems = useMemo(
    () =>
      resumeData?.resume_items.filter((item) =>
        item.category_titles.includes("Skills")
      ) || [],
    [resumeData]
  );

  const aboutItem = useMemo(
    () =>
      resumeData?.resume_items.find((item) =>
        item.category_titles.includes("About Me")
      ) || null,
    [resumeData]
  );

  if (loading) {
    return (
      <section className="flex flex-col justify-center text-white py-10">
        <Container>
          <div>Loading...</div>
        </Container>
      </section>
    );
  }

  if (error) {
    return (
      <section className="flex flex-col justify-center text-white py-10">
        <Container>
          <div>{error}</div>
        </Container>
      </section>
    );
  }

  return (
    <section className="flex flex-col justify-center text-white py-10">
      <Container>
        <motion.div
          initial={{ opacity: 0 }}
          animate={{
            opacity: 1,
            transition: { delay: 0.3, duration: 0.4, ease: "easeIn" },
          }}
          className="w-full"
        >
          <Tabs
            defaultValue="experience"
            className="w-full flex flex-col md:flex-row gap-6 md:gap-10"
          >
            <TabsList className="flex md:flex-col h-full bg-transparent md:w-64 gap-4">
              {tabMenu.map((item) => (
                <TabsTrigger
                  key={item.value}
                  value={item.value}
                  className="bg-white/10 w-full py-2.5 text-white data-[state=active]:bg-hoverColor hover:bg-lightSky/50 text-xs sm:text-sm"
                >
                  <div className="flex items-center gap-1.5 md:w-[50%] md:gap-3">
                    <item.icon className="w-4 h-4 md:h-5 md:w-5" />
                    {item.title}
                  </div>
                </TabsTrigger>
              ))}
            </TabsList>

            <div className="flex-1 min-h-[400px]">
              <TabsContent value="experience">
                <motion.h2
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  className="text-2xl font-bold mb-6 text-lightSky"
                >
                  Professional Experience
                </motion.h2>

                <div className="space-y-6">
                  {experienceItems.map((item, index) => (
                    <motion.div
                      key={item.id}
                      initial={{ opacity: 0, y: 20 }}
                      animate={{ opacity: 1, y: 0 }}
                      transition={{ delay: index * 0.1 }}
                      className="border rounded-lg border-lightSky/20 p-6"
                    >
                      <div className="mb-4">
                        <h3 className="text-lg font-semibold">{item.title}</h3>
                        <p className="text-muted-foreground">{item.sub_title}</p>
                      </div>

                      <div
                        className="mb-4 text-white/80"
                        dangerouslySetInnerHTML={{
                          __html: item.description[0]?.value || "",
                        }}
                      />

                      <div className="flex flex-wrap gap-2">
                        {item.resume_tag_titles.map((tag, i) => (
                          <Badge key={i} variant="secondary">
                            {tag}
                          </Badge>
                        ))}
                      </div>
                    </motion.div>
                  ))}
                </div>
              </TabsContent>

              <TabsContent value="education">
                <motion.h2
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  className="text-2xl font-bold mb-6 text-lightSky"
                >
                  Educational Background
                </motion.h2>

                <div className="space-y-6">
                  {educationItems.map((item, index) => (
                    <motion.div
                      key={item.id}
                      initial={{ opacity: 0, y: 20 }}
                      animate={{ opacity: 1, y: 0 }}
                      transition={{ delay: index * 0.1 }}
                      className="border rounded-lg border-lightSky/20 p-6"
                    >
                      <div className="mb-4">
                        <h3 className="text-lg font-semibold">{item.title}</h3>
                        <p className="text-muted-foreground">{item.sub_title}</p>
                      </div>

                      <div
                        className="mb-4 text-white/80"
                        dangerouslySetInnerHTML={{
                          __html: item.description[0]?.value || "",
                        }}
                      />

                      <div className="flex flex-wrap gap-2">
                        {item.resume_tag_titles.map((tag, i) => (
                          <Badge key={i} variant="secondary">
                            {tag}
                          </Badge>
                        ))}
                      </div>
                    </motion.div>
                  ))}
                </div>
              </TabsContent>

              <TabsContent value="skills">
                <motion.h2
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  className="text-2xl font-bold mb-6 text-lightSky"
                >
                  Technical Skills
                </motion.h2>

                <div className="space-y-6">
                  {skillItems.map((item, index) => (
                    <motion.div
                      key={item.id}
                      initial={{ opacity: 0, y: 20 }}
                      animate={{ opacity: 1, y: 0 }}
                      transition={{ delay: index * 0.1 }}
                      className="border rounded-lg border-lightSky/20 p-6"
                    >
                      <h3 className="text-lg font-semibold mb-4">{item.title}</h3>

                      {item.sub_title && (
                        <p className="text-muted-foreground mb-3">{item.sub_title}</p>
                      )}

                      <div
                        className="text-sm text-white/60 mb-4 font-normal leading-7"
                        dangerouslySetInnerHTML={{
                          __html: item.description[0]?.value || "",
                        }}
                      />

                      <div className="flex flex-wrap gap-2">
                        {item.resume_tag_titles.map((skill, i) => (
                          <Badge key={i} variant="secondary">
                            {skill}
                          </Badge>
                        ))}
                      </div>
                    </motion.div>
                  ))}
                </div>
              </TabsContent>

              <TabsContent value="about">
                <motion.h2
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  className="text-2xl font-bold mb-6 text-lightSky"
                >
                  About Me
                </motion.h2>

                {aboutItem && (
                  <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    className="border rounded-lg border-lightSky/20 p-6"
                  >
                    <div
                      className="mb-6 text-lg"
                      dangerouslySetInnerHTML={{
                        __html: aboutItem.description[0]?.value || "",
                      }}
                    />

                    <div className="space-y-4">
                      {aboutItem.resume_tag_titles.length > 0 && (
                        <div>
                          <h3 className="text-lg font-semibold mb-2">Interests</h3>
                          <div className="flex flex-wrap gap-2">
                            {aboutItem.resume_tag_titles.map((interest, i) => (
                              <Badge key={i} variant="secondary">
                                {interest}
                              </Badge>
                            ))}
                          </div>
                        </div>
                      )}

                      {aboutItem.language_tag_titles.length > 0 && (
                        <div>
                          <h3 className="text-lg font-semibold mb-2">Languages</h3>
                          <div className="flex flex-wrap gap-2">
                            {aboutItem.language_tag_titles.map((language, i) => (
                              <Badge key={i} variant="secondary">
                                {language}
                              </Badge>
                            ))}
                          </div>
                        </div>
                      )}
                    </div>
                  </motion.div>
                )}
              </TabsContent>
            </div>
          </Tabs>
        </motion.div>
      </Container>
    </section>
  );
}