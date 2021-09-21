import { Box, Text } from '@chakra-ui/react';
import { useColorModeValue } from '@chakra-ui/color-mode';
import education from '../../content/education.json';
import Timeline from '../layout/Timeline';

function ItemComponent({ item }) {
  const value = useColorModeValue('green.500', 'green.300');
  const color = useColorModeValue('white', 'gray.800');
  return <Box bg={value} color={color} borderRadius="16px" p="1em">
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