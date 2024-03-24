import React from "react";
import { VscTerminal } from "react-icons/vsc";
import {
  Box,
  Text,
  Button,
  Collapse,
  UnorderedList,
  List,
  ListItem,
  ListIcon,
  useColorModeValue,
} from "@chakra-ui/react";
import CustomBadge from "../layout/CustomBadge";
import experience from "../../content/experience.json";
import ZigZagList from "../layout/ZigZagList";

function Description({ description }) {
  if (typeof description === "string") {
    return <Text fontSize="sm">{description}</Text>;
  }
  if (Array.isArray(description)) {
    return (
      <UnorderedList>
        {description.map((x, i) => (
          <ListItem key={i}>
            <Description description={x} />
          </ListItem>
        ))}
      </UnorderedList>
    );
  }
  return null;
}

function ItemComponent({ item }) {
  const [isOpen, setIsOpen] = React.useState(false);
  return (
    <Box>
      <Text as="h2" fontWeight="extrabold" fontSize={{ base: "lg", md: "xl" }}>
        {[item.company, item.title].filter(Boolean).join(" - ")}
      </Text>
      <Text as="sup">{[item.start, item.end].filter(Boolean).join(" - ")}</Text>
      {item.description && (
        <Box mb="1rem">
          <Description description={item.description} />
        </Box>
      )}
      <List>
        <Collapse in={isOpen} animateOpacity>
          {item.timeline.map((x, i) => {
            return (
              <ListItem key={i} display="flex" mb="1rem">
                <ListIcon as={VscTerminal} mt="0.5em" />
                <Box>
                  <Text as="h3" fontWeight="hairline" fontSize={{ base: "lg" }}>
                    {x.title}
                  </Text>
                  <Text as="sup">
                    {[x.start, x.end].filter(Boolean).join(" - ")}
                  </Text>
                  <Box>
                    {(x.highlights || []).map((b) => (
                      <CustomBadge
                        key={b}
                        me="0.5rem"
                        mb="0.5em"
                        variant="secondary"
                      >
                        {b}
                      </CustomBadge>
                    ))}
                  </Box>
                  <Description description={x.description} />
                </Box>
              </ListItem>
            );
          })}
        </Collapse>
        <Button color="gray.800" size="xs" bg="secondary.500" sx={{_hover: {}, _active: {}}} onClick={() => setIsOpen(x => !x)}>
          {isOpen ? "Less" : "More"}
        </Button>
      </List>
    </Box>
  );
}

function Experience() {
  const value = useColorModeValue("colors.primary.500", "colors.primary.300");
  const { timeline } = experience;
  return (
    <Box sx={{ color: value }}>
      <ZigZagList items={timeline} ItemComponent={ItemComponent} />
    </Box>
  );
}

export default Experience;
