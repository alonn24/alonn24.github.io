import { Button, Box, VStack } from "@chakra-ui/react";
import { useColorModeValue } from '@chakra-ui/color-mode';
import { useColorMode } from "@chakra-ui/color-mode";
import Section from './layout/Section';
import AboutMe from "./sections/AboutMe";
import Education from "./sections/Education";
import Experience from "./sections/Experience";
import Profile from "./sections/Profile";

function CVPage() {
  const value = useColorModeValue('colors.green.500', 'colors.green.300')
  const { colorMode, toggleColorMode } = useColorMode();
  return <VStack padding="1em" alignItems="start" sx={{ "--contact-border-color": value }}>
    <Button onClick={toggleColorMode}>
      Toggle {colorMode === "light" ? "Dark" : "Light"}
    </Button>
    <Box mt="3rem" display={{ md: 'flex' }} >
      <Profile flex="1" />
      <Section flex="2" title="About me" mt={{ base: '2rem', md: "1rem" }}>
        <AboutMe />
      </Section>
    </Box>
    <Box>
      <Section title="Experience" mt="2rem">
        <Experience />
      </Section>
    </Box><Box>
      <Section title="Education" mt="2rem">
        <Education />
      </Section>
    </Box>
  </VStack>
}

export default CVPage;