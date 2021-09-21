import css from './Profile.module.css';
import { VscCallOutgoing, VscMail } from "react-icons/vsc";
import { Box, Avatar, VStack, Link } from '@chakra-ui/react';

import profile from '../../content/profile.json';

function Profile(props) {
  return <VStack {...props} >
    <Box className={css.avatar}>
      <Box className={css.overlay} bg="var(--contact-border-color)" />
      <Avatar name={`${profile.firstName} ${profile.lastName}`} src={profile.avatarUrl} size="xl" />
    </Box>
    <div className={css.name}>{profile.firstName}<br />{profile.lastName}</div>
    <div className={css.role}>{profile.role}</div>
    <Box className={css.contact}>
      <Link display="inline-block" px="1rem" href={`tel:${profile.phone}`}><VscCallOutgoing /></Link>
      <Link display="inline-block" px="1rem" href={`mailto:${profile.email}`}><VscMail /></Link>
    </Box>
  </VStack>;
}

export default Profile;