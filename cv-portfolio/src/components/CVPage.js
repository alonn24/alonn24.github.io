import { Box, VStack } from "@chakra-ui/react";
import { useColorModeValue } from '@chakra-ui/color-mode';
import Toolbar from './sections/Toolbar';
import Section from './layout/Section';
import AboutMe from "./sections/AboutMe";
import Education from "./sections/Education";
import Experience from "./sections/Experience";
import Profile from "./sections/Profile";

function CVPage() {
  const value = useColorModeValue('colors.primary.300', 'colors.primary.300');
  const inverseColor = useColorModeValue('colors.gray.800', 'colors.gray.800');
  const gardiend = useColorModeValue(
    "linear(to-r, secondary.300, primary.300)",
    "linear(to-r, secondary.500, primary.500)"
  );
  
  const sx = { "--contact-border-color": value, "--text-color-inverse": inverseColor };
  return <VStack alignItems="stretch" sx={sx}>
    <Box py="3rem" bgGradient={gardiend} display={{ md: 'flex' }} >
      <Profile flex="1" />
      <Section flex="2" title="About me" mt={{ base: '2rem', md: "1rem" }}>
        <AboutMe />
      </Section>
    </Box>
    <Box>
      <Section title="Experience">
        <Experience />
      </Section>
    </Box><Box>
      <Section title="Education">
        <Education />
      </Section>
    </Box>
    <Toolbar />
  </VStack>
}

export default CVPage;