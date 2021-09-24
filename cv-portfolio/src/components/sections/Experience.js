import { VscTerminal } from "react-icons/vsc";
import { Box, Text, UnorderedList, List, ListItem, ListIcon } from '@chakra-ui/react';
import CustomBadge from '../layout/CustomBadge';
import experience from '../../content/experience.json';
import ZigZagList from '../layout/ZigZagList';

function Description({ description }) {
  if (typeof description === 'string') {
    return <Text fontSize="xs" >{description}</Text>;
  }
  if (Array.isArray(description)) {
    return <UnorderedList>
      {description.map((x, i) => <ListItem key={i}>
        <Description description={x} />
      </ListItem>)}
    </UnorderedList>
  }
  return null;
}

function ItemComponent({ item }) {
  return <Box>
    <Text fontWeight="extrabold" fontSize={{ base: "lg", md: "xl" }}>{[item.company, item.title].filter(Boolean).join(' - ')}</Text>
    <Text as="sup">{[item.start, item.end].filter(Boolean).join(' - ')}</Text>
    {item.description && <Description description={item.description} />}
    <List>
      {item.timeline.map((x, i) => {
        return <ListItem key={i} display="flex" mb="1rem">
          <ListIcon as={VscTerminal} mt="0.5em" />
          <Box>
            <Text fontWeight="hairline" fontSize={{ base: "lg" }}>{x.title}</Text>
            <Text as="sup">{[x.start, x.end].filter(Boolean).join(' - ')}</Text>
            <Box>{(x.highlights || []).map(b => <CustomBadge key={b} me="0.5rem" mb="0.5em" secondary>{b}</CustomBadge>)}</Box>
            <Description description={x.description} />
          </Box>
        </ListItem>
      })}
    </List>
  </Box>;
}

function Experience() {
  const { timeline } = experience;
  return <ZigZagList items={timeline} ItemComponent={ItemComponent} />;
}

export default Experience;