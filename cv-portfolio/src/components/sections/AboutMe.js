import { Box } from '@chakra-ui/react';
import profile from '../../content/profile.json';
import CustomBadge from '../layout/CustomBadge';
function AboutMe() {
  const { aboutMe, skills } = profile;
  return <div>
    <Box>{aboutMe}</Box>
    <Box my="1rem">
      {skills.map(x => <CustomBadge key={x} me="0.5rem" mb="0.5em">{x}</CustomBadge>)}
    </Box>
  </div>
};

export default AboutMe;