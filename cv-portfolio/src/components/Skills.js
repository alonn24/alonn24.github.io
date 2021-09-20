import profile from '../content/profile.json';
import { Grid, GridItem, CircularProgress } from "@chakra-ui/react"
function Skills() {
  const { skills } = profile;
  return <Grid templateColumns="repeat(2, 2fr 1fr)" >
  {Object.keys(skills).map(s =>
    <>
      <GridItem display="flex" alignItems="center"><span>{s}:</span></GridItem>
      <GridItem display="flex" alignItems="center">
        <CircularProgress flex={1} value={skills[s]} />
      </GridItem>
    </>
  )}
</Grid>
}

export default Skills;