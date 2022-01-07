import React from 'react';
import { Text, Box } from '@chakra-ui/react';
import css from './Education.module.css';

function EducationCard({ item }) {
  return <Box className={css.card}>
    <Text as="h2" fontWeight="extrabold" fontSize="lg">{item.organization}</Text>
    <Text as="h3" fontSize="sm">{item.title}</Text>
    <Text as="sub">{item.start} - {item.end}</Text>
  </Box>
};

export default EducationCard;
