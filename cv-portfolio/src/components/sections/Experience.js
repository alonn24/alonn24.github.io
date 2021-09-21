import css from './Experience.module.css'
import experience from '../../content/experience.json';
import ZigZagList from '../layout/ZigZagList';
import { Box, Text } from '@chakra-ui/layout';

function Description({ description }) {
  if (typeof description === 'string') {
    return description;
  }
  if (Array.isArray(description)) {
    return <ul className={css.descriptionList}>
      {description.map(x => <li>
        <Description description={x} />
      </li>)}
    </ul>
  }
  return null;
}

function ItemComponent({ item }) {
  return <Box>
    <Text fontWeight="extrabold" fontSize="lg">{[item.company, item.title].filter(Boolean).join(' - ')}</Text>
    <Text as="sup">{[item.start, item.end].filter(Boolean).join(' - ')}</Text>
    {item.description && <Description description={item.description} />}
    {/* {item.timeline && <ZigZagList items={item.timeline} ItemComponent={ItemComponent} />} */}
  </Box>;
}

function Experience() {
  const { timeline } = experience;
  return <ZigZagList items={timeline} ItemComponent={ItemComponent} />;
}

export default Experience;