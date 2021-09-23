import { Box, Text } from '@chakra-ui/react';
import education from '../../content/education.json';
import Timeline from '../layout/Timeline';

function ItemComponent({ item }) {
  // const bg = useColorModeValue('primary.500', 'primary.300');
  
  return <Box bg={"var(--contact-border-color)"} color={"var(--text-color-inverse)"} borderRadius="16px" p="1em">
    <Text fontWeight="extrabold" fontSize="lg">{item.organization}</Text>
    <Text fontSize="sm">{item.title}</Text>
    <Text as="sup">{item.start} - {item.end}</Text>
  </Box>;
}

function Education() {
  const { timeline } = education;
  return <Timeline items={timeline} ItemComponent={ItemComponent} />;
};

export default Education;