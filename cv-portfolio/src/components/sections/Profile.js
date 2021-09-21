import css from './Profile.module.css';
import { PhoneIcon, EmailIcon } from '@chakra-ui/icons'
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
      <Link px="1rem" href={`tel:${profile.phone}`}><PhoneIcon /></Link>
      <Link px="1rem" href={`mailto:${profile.email}`}><EmailIcon /></Link>
    </Box>
  </VStack>;
}

export default Profile;