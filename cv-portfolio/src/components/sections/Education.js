import { Box } from '@chakra-ui/react';
import education from '../../content/education.json';
import css from './Education.module.css';
import EducationCard from './EducationCard';

function Education() {
  const { timeline } = education;
  return <Box className={css.education} >
    <Box className={css.titleCard}>
      <q>Never stop learning, becuase life never stop teaching.</q>
    </Box>
    <Box className={css.cards}>{timeline.map((item, index) => <EducationCard key={index} item={item} />)}</Box>
  </Box>
}

export default Education;