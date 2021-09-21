import css from './Section.module.css'
import { VStack, Text, Box } from '@chakra-ui/react';
function Section(props) {
  const { title, ...restProps } = props;
  return <VStack alignItems="stretch" color="primary.100" {...restProps}>
    <Text pl={{ base: '1rem', sm: '0' }}
      pr={{ base: '0', sm: '1rem' }}
      fontWeight="bold"
      alignSelf={{ base: 'end', sm: 'start' }}
      className={css.title}>
      {title}
    </Text>
    <Box>{props.children}</Box>
  </VStack>
}

export default Section;