import { Box, VStack } from "@chakra-ui/react";
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
    <Hero py="3rem">
      <Profile position="relative" as="h2" flex="1" />
      <Section position="relative" as="h1" flex="2" title="About me" mt={{ base: '2rem', md: "1rem" }}>
        <AboutMe />
      </Section>
    </Hero>
    <Box>
      <Section as="h1" title="Experience">
        <Experience />
      </Section>
    </Box><Box>
      <Section as="h1" title="Education">
        <Education />
      </Section>
    </Box>
    <Toolbar />
  </VStack>
}

export default CVPage;