import css from './Section.module.css'
import { VStack, Text, Box } from '@chakra-ui/react';
function Section(props) {
  const { title, ...restProps } = props;
  return <VStack alignItems="flex-start" color="brand.100" {...restProps}>
    <Text alignSelf={{ base:'center', sm: 'start' }} className={css.title}>{title}</Text>
    <Box>{props.children}</Box>
  </VStack>
}

export default Section;