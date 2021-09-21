import { Box, useStyleConfig } from "@chakra-ui/react"

function CustomBadge(props) {
  const { size, variant, secondary, ...rest } = props
  const styles = useStyleConfig(secondary ? "CustomBadgeSecondary" : "CustomBadge", { size, variant })
  return <Box as="span" sx={styles} {...rest} />
}
export default CustomBadge;