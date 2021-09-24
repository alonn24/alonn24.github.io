import css from './Profile.module.css';
import { VscCallOutgoing, VscMail } from "react-icons/vsc";
import { Text, Box, Avatar, VStack, Link } from '@chakra-ui/react';

import profile from '../../content/profile.json';

function Profile(props) {
  return <VStack {...props} >
    <Box className={css.avatar}>
      <Box className={css.overlay} bg="var(--contact-border-color)" />
      <Avatar name={`${profile.firstName} ${profile.lastName}`} src={profile.avatarUrl} size="xl" />
    </Box>
    <Text casing="uppercase" textAlign="center" letterSpacing="0.2rem" fontWeight="extrabold" className={css.name}>{profile.firstName}<br />{profile.lastName}</Text>
    <Text as="i">{profile.role}</Text>
    <Box className={css.contact}>
      <Link aria-label="call me" display="inline-block" px="1rem" href={`tel:${profile.phone}`}><VscCallOutgoing /></Link>
      <Link aria-label="mail me" display="inline-block" px="1rem" href={`mailto:${profile.email}`}><VscMail /></Link>
    </Box>
  </VStack>;
}

export default Profile;