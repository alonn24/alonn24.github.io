import { Box, Text } from '@chakra-ui/react';
import education from '../../content/education.json';
import css from './Education.module.css';
import EducationCard from './EducationCard';

function Education() {
  const { timeline } = education;
  return <Box className={css.education} >
    <Box className={css.titleCard}>
      <Text>What did I learn?</Text>
    </Box>
    <Box className={css.cards}>{timeline.map(item => <EducationCard item={item} />)}</Box>
  </Box>
}

export default Education;