import css from './Section.module.css'
import { VStack, Text, Box, useMediaQuery } from '@chakra-ui/react';
function Section(props) {
  const [isPrint] = useMediaQuery('print');
  const { title, as, ...restProps } = props;
  return <VStack px="1rem" alignItems="stretch" color="primary.100" {...restProps}>
    <Text as={as} 
      fontWeight={isPrint ? 'extrabold' : "hairline"}
      fontSize="2xl"
      alignSelf={{ base: 'center' }}
      className={css.title}>
      {title}
    </Text>
    {props.children}
  </VStack>
}

export default Section;