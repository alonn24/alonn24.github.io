import css from './Profile.module.css';
import { Box, Avatar, VStack } from '@chakra-ui/react';
import profile from '../content/profile.json';

function Profile(props) {
  // const { colorMode, toggleColorMode } = useColorMode();
  return <VStack {...props} className={css.profileSection}>
    <Box className={css.overlay} bg="white" />
    <Avatar name={`${profile.firstName} ${profile.lastName}`} src={profile.avatarUrl} size="xl" />
    <Box className={css.name}>{profile.firstName}<br />{profile.lastName}</Box>
  </VStack>;
}

export default Profile;