import css from './Section.module.css'
import { VStack, Text, Box, useMediaQuery } from '@chakra-ui/react';
function Section(props) {
  const [isPrint] = useMediaQuery('print');
  const { title, ...restProps } = props;
  return <VStack p="1rem" alignItems="stretch" color="primary.100" {...restProps}>
    <Text pl={{ base: '1rem', sm: '0' }}
      pr={{ base: '0', sm: '1rem' }}
      fontWeight={isPrint ? 'extrabold' : "hairline"}
      fontSize="xl"
      alignSelf={{ base: isPrint ? 'start' : 'end', sm: 'start' }}
      className={css.title}>
      {title}
    </Text>
    <Box>{props.children}</Box>
  </VStack>
}

export default Section;