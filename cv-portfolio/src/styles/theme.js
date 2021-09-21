import { extendTheme } from "@chakra-ui/react"
import { mode } from "@chakra-ui/theme-tools"

const components = {
  CustomBadge: {
    baseStyle: ({ colorMode }) => ({
      bg: colorMode === "dark" ? "green.300" : "green.500",
      color: colorMode === "dark" ? "gray.800" : "white",
      textTransform: "uppercase",
      fontWeight: "semibold",
      letterSpacing: "0.02em",
      padding: "4px 8px",
      borderRadius: "2px",
      fontSize: "12px",
      display: 'inline-block',
      whiteSpace: "nowrap"
    }),
  },
}
const config = {
  components,
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