import { extendTheme } from "@chakra-ui/react"
import { mode } from "@chakra-ui/theme-tools"

const components = {
  ColoredSection: {
    baseStyle: ({ colorMode }) => ({
      bg: colorMode === "dark" ? "primary.300" : "secondary.300",
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
      300: 'rgb(100, 70, 129)',
      500: 'rgb(60, 42, 77)'
    },
    secondary: {
      300: 'rgb(173 200 219);',
      500: 'rgb(149, 173, 190);'
    },
    trinary: {
      300: 'rgb(224, 240, 234);',
      500: 'rgb(175 187 182);'
    },
    background: {
      light: 'gray.800',
      dark: 'gray.50'
    },
    shadow: {
      'small-left': '-5px 0px 10px -4px #000000',
      'small-right': '5px 0px 10px -4px #000000',
    }
  },
  styles: {
    global: (props) => ({
      body: {
        fontFamily: "sans-serif",
        fontSize: "16px",
        color: mode("gray.800", "whiteAlpha.900")(props),
        bg: mode("gray.50", "gray.800")(props),
        lineHeight: "base",
      },
    }),
  },
}

const theme = extendTheme(config)
export default theme