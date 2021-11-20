import { extendTheme } from "@chakra-ui/react"
import { mode } from "@chakra-ui/theme-tools"

const components = {
  ColoredSection: {
    baseStyle: ({ colorMode }) => ({
      bg: colorMode === "dark" ? "rgba(246, 173, 85, 0.8)" : "secondary.500",
      color: colorMode === "dark" ? "gray.800" : "whiteAlpha.900",
    })
  },
  CustomBadge: {
    baseStyle: ({ colorMode }) => ({
      bg: colorMode === "dark" ? "primary.300" : "secondary.500",
      color: colorMode === "dark" ? "gray.800" : "whiteAlpha.900",
      textTransform: "uppercase",
      fontWeight: "semibold",
      padding: "4px 8px",
      borderRadius: "6px",
      fontSize: "12px",
      display: 'inline-block',
      whiteSpace: "nowrap"
    }),
    variants: {
      secondary: ({ colorMode }) => ({
        bg: colorMode === "dark" ? "secondary.300" : "secondary.300",
        color: colorMode === "dark" ? "gray.800" : "gray.800",
        padding: "2px 4px",
      })
    },
  },
}
const config = {
  components,
  colors: {
    primary: {
      300: '#F6AD55',
      500: '#DD6B20'
    },
    secondary: {
      300: '#63B3ED',
      500: '#3182CE'
    },
    trinary: {
      300: '#B794F4',
      500: '#805AD5'
    }
  },
  styles: {
    global: (props) => ({
      body: {
        fontFamily: "sans-serif",
        fontSize: "16px",
        color: mode("gray.800", "whiteAlpha.900")(props),
        bg: mode("#f8f8f8", "gray.800")(props),
        lineHeight: "base",
      },
    }),
  },
}

const theme = extendTheme(config)
export default theme