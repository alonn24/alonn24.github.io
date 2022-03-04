import { Box } from "@chakra-ui/react";
import { useColorModeValue } from '@chakra-ui/color-mode';
import Toolbar from './sections/Toolbar';
import Section from './layout/Section';
import AboutMe from "./sections/AboutMe";
import Education from "./sections/Education";
import Experience from "./sections/Experience";
import Profile from "./sections/Profile";
import Hero from "./layout/Hero";
import RainyBackground from "./RainyBackground";

function CVPage() {
  const value = useColorModeValue('colors.primary.300', 'colors.primary.300');
  const inverseColor = useColorModeValue('white', 'colors.gray.800');
  const background = useColorModeValue("colors.gray.50", "colors.gray.800");
  const sx = { 
    "--contact-border-color": value, 
    "--text-color-inverse": inverseColor,
    "--background-color": background,
   };
  return <>
    <RainyBackground />
    <Box display="flex" flexDirection="column" alignItems="stretch" position="relative" sx={sx}>
      <Hero>
        <Profile as="h2" />
        <Section as="h1" flex="1" title="About me" mt={{ base: '1rem' }}>
          <AboutMe />
        </Section>
      </Hero>
      <Section as="h1" title="Experience">
        <Experience />
      </Section>
      <Section as="h1" title="Education">
        <Education />
      </Section>
      <Toolbar />
    </Box>
  </>
}

export default CVPage;