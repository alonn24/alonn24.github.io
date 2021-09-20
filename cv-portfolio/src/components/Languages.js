import experience from '../content/experience.json';
import { Grid, GridItem, Progress } from "@chakra-ui/react"

function Languages() {
  const { languages } = experience;
  return <Grid templateColumns="1fr 2fr" >
    {Object.keys(languages).map(l =>
      <>
        <GridItem><span>{l}:</span></GridItem>
        <GridItem display="flex" alignItems="center">
          <Progress size="lg" flex={1} value={languages[l]} />
        </GridItem>
      </>
    )}
  </Grid>
}
export default Languages;