import { Button, Box, VStack } from "@chakra-ui/react";
import { useColorModeValue } from '@chakra-ui/color-mode';
import { useColorMode } from "@chakra-ui/color-mode";
import Section from './layout/Section';
import AboutMe from "./sections/AboutMe";
import Education from "./sections/Education";
import Experience from "./sections/Experience";
import Languages from "./sections/Languages";
import Profile from "./sections/Profile";

function CVPage() {
  const value = useColorModeValue('black', 'white')
  const { colorMode, toggleColorMode } = useColorMode();
  return <VStack padding="1em" sx={{ "--contact-border-color": value }}>
    <Button onClick={toggleColorMode}>
      Toggle {colorMode === "light" ? "Dark" : "Light"}
    </Button>
    <Box mt="3rem" display={{ md: 'flex' }}>
      <Profile flex="1" mb={{ base:'3rem', md: "1rem" }} />
      <Section flex="2" title="About me">
        <AboutMe />
      </Section>
    </Box>
    <VStack alignItems="stretch">
      <Section title="Education">
        <Education />
      </Section>
      <Section title="Experience">
        <Experience />
      </Section>
      <Languages />
    </VStack>
  </VStack>
}

export default CVPage;