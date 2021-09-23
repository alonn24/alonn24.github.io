import { VscLightbulb } from "react-icons/vsc";
import { Box } from "@chakra-ui/react";
import { useColorMode } from "@chakra-ui/color-mode";

function Toolbar() {
  const { toggleColorMode } = useColorMode();
  return <Box position="absolute" top="0" left="0">
    <Box as="button" p="1rem" onClick={toggleColorMode}>
      <VscLightbulb />
    </Box>
  </Box>
}

export default Toolbar;