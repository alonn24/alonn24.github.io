import { VStack } from "@chakra-ui/react";
import { useColorModeValue } from '@chakra-ui/color-mode';
import Toolbar from './sections/Toolbar';
import Section from './layout/Section';
import AboutMe from "./sections/AboutMe";
import Education from "./sections/Education";
import Experience from "./sections/Experience";
import Profile from "./sections/Profile";
import Hero from "./layout/Hero";

function CVPage() {
  const value = useColorModeValue('colors.primary.300', 'colors.primary.300');
  const inverseColor = useColorModeValue('colors.gray.800', 'colors.gray.800');

  const sx = { "--contact-border-color": value, "--text-color-inverse": inverseColor };
  return <VStack alignItems="stretch" sx={sx}>
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
  </VStack>
}

export default CVPage;