import { Box, useStyleConfig } from "@chakra-ui/react"

function CustomBadge(props) {
  const { size, variant, ...rest } = props
  const styles = useStyleConfig("CustomBadge", { size, variant })
  return <Box as="span" sx={styles} {...rest} />
}
export default CustomBadge;