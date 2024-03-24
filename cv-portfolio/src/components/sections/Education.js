import { useEffect, useState } from "react";
import { Box, Fade } from "@chakra-ui/react";
import education from "../../content/education.json";
import css from "./Education.module.css";
import EducationCard from "./EducationCard";

const sentences = [
  "Keep pursuing knowledge, for life is an endless teacher.",
  "Always seek new knowledge, as life's lessons are perpetual.",
  "Embrace lifelong learning, as life is an eternal educator.",
  "Stay committed to learning, for life's teachings are constant.",
  "Never cease learning, as life's lessons are unending.",
  "Maintain a thirst for knowledge, as life's wisdom is infinite.",
  "Keep expanding your horizons, for life's education is ongoing.",
  "Embrace continuous learning, as life never stops imparting wisdom.",
  "Stay curious and open-minded, for life is a perpetual source of learning.",
  "Commit to lifelong growth, as life's lessons are never-ending.",
];
function Education() {
  const [si, setSi] = useState(0);

  useEffect(function rotateSentence() {
    const interval = setInterval(() => {
      setSi((si) => (si + 1) % sentences.length);
    }, 5000);
    return () => clearInterval(interval);
  }, []);

  const { timeline } = education;
  return (
    <Box className={css.education}>
      <Box className={css.titleCard} key={si}>
        <Fade in key={si}>
          <q>{sentences[si]}</q>
        </Fade>
      </Box>
      <Box className={css.cards}>
        {timeline.map((item, index) => (
          <EducationCard key={index} item={item} />
        ))}
      </Box>
    </Box>
  );
}

export default Education;
