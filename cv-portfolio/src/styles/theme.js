import { extendTheme } from "@chakra-ui/react"
import { mode } from "@chakra-ui/theme-tools"

const config = {
  styles: {
    global: (props) => ({
      body: {
        fontFamily: "sans-serif",
        color: mode("gray.800", "whiteAlpha.900")(props),
        bg: mode("white", "gray.800")(props),
        lineHeight: "base",
      },
    }),
  },
}

const theme = extendTheme(config)
export default theme