import css from './Profile.module.css';
import { VscCallOutgoing, VscMail } from "react-icons/vsc";
import { motion } from "framer-motion"
import { useStyleConfig, Text, Box, Avatar, Link } from '@chakra-ui/react';

import profile from '../../content/profile.json';

function Profile() {
  const styles = useStyleConfig("ColoredSection")
  return <motion.div
    transition={{ duration: 1 }}
    animate={{
      x: ["-50%", "0%"],
    }}>
    <Box sx={styles} className={css.profile}>
      <Box className={css.avatar}>
        <Box className={css.overlay} bg="black" />
        <Avatar display="block" m="auto" name={`${profile.firstName} ${profile.lastName}`} src="/images/my-profile.png" size="xl" />
      </Box>
      <Box>
        <Text as="h2" casing="uppercase" textAlign="center" letterSpacing="0.2rem" fontWeight="extrabold" className={css.name}>{profile.firstName}<br />{profile.lastName}</Text>
        <Text as="i">{profile.role}</Text>
        <Box className={css.contact}>
          <Link aria-label="call me" display="inline-block" px="1rem" href={`tel:${profile.phone}`}><VscCallOutgoing /></Link>
          <Link aria-label="mail me" display="inline-block" px="1rem" href={`mailto:${profile.email}`}><VscMail /></Link>
        </Box>
      </Box>
    </Box>
  </motion.div>;
}

export default Profile;