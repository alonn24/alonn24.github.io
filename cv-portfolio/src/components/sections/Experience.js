import React from "react";
import { VscTerminal, VscFolderOpened, VscFolder } from "react-icons/vsc";
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
  useDisclosure,
} from "@chakra-ui/react";
import CustomBadge from "../layout/CustomBadge";
import experience from "../../content/experience.json";
import ZigZagList from "../layout/ZigZagList";

function Description({ description }) {
  const { isOpen, onToggle, onOpen } = useDisclosure({ defaultIsOpen: false });

  if (typeof description === "string") {
    return <Text fontSize="sm">{description}</Text>;
  }

  if (Array.isArray(description)) {
    const hasMoreItems = description.length > 1;
    return (
      <>
        <Collapse
          in={!hasMoreItems || isOpen}
          startingHeight={15}
          animateOpacity
          onClick={onOpen}
          cursor={hasMoreItems ? "pointer" : "default"}
        >
          <UnorderedList>
            {description.map((x, i) => (
              <ListItem key={i}>
                <Description description={x} />
              </ListItem>
            ))}
          </UnorderedList>
        </Collapse>
        {hasMoreItems && (
          <Button
            variant="link"
            mt="0.5rem"
            color="gray.800"
            sx={{ _hover: {}, _active: {} }}
            onClick={onToggle}
          >
            {isOpen ? <VscFolderOpened /> : <VscFolder />}
          </Button>
        )}
      </>
    );
  }
  return null;
}

function ItemComponent({ item }) {
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
      </List>
    </Box>
  );
}

function Experience() {
  const value = useColorModeValue("colors.primary.500", "colors.primary.300");
  const { timeline } = experience;
  return (
    <Box color={value}>
      <ZigZagList items={timeline} ItemComponent={ItemComponent} />
    </Box>
  );
}

export default Experience;
