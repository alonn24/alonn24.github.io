import css from './Section.module.css'
import { Text, Box, useMediaQuery } from '@chakra-ui/react';
function Section(props) {
  const [isPrint] = useMediaQuery('print');
  const { title, as, ...restProps } = props;
  return <Box display="flex" flexDirection="column" px="1rem" alignItems="stretch"  {...restProps}>
    <Text as={as} 
      fontWeight={isPrint ? 'extrabold' : "hairline"}
      fontSize="2xl"
      alignSelf={{ base: 'center' }}
      className={css.title}>
      {title}
    </Text>
    {props.children}
  </Box>
}

export default Section;