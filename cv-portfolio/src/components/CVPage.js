import { HStack, VStack } from "@chakra-ui/react";
import AboutMe from "./AboutMe";
import Education from "./Education";
import Experience from "./Experience";
import Languages from "./Languages";
import Profile from "./Profile";
import Skills from "./Skills";

function CVPage() {
  return <><HStack padding="1em" templateColumns="1fr 150px 1fr">
    <VStack flex="1 1 0" alignSelf="flex-start" alignItems="stretch">
      <AboutMe />
      <Education />
    </VStack>
    <Profile alignSelf="flex-start" height="100%" minHeight="calc(100vh - 2em)" />
    <VStack flex="1 1 0" alignSelf="flex-end" alignItems="stretch">
      <Skills />
      <Languages />
    </VStack>
  </HStack>
    <Experience />
  </>
}

export default CVPage;