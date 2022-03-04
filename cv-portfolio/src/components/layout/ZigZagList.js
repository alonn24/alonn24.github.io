import css from './ZigZagList.module.css'
import { motion } from "framer-motion"
import { useInView } from 'react-intersection-observer';
import { Box } from '@chakra-ui/react';

const variants = {
  hidden: {
    left: '-50px',
    opacity: 0,
  }
};

const altVariants = {
  hidden: {
    right: '-50px',
    opacity: 0,
  }
}

function ListItem({ i, ...props }) {
  const [ref, inView] = useInView({
    threshold: 0.3,
    triggerOnce: true
  });
  const isAlt = i % 2 === 1;
  return <motion.li ref={ref} variants={isAlt? altVariants : variants} animate={inView ? '' : 'hidden'} className={i % 2 ? css.listItemAlt : css.listItem}>
    <Box>{props.children}</Box>
  </motion.li>;
}

function ZigZagList({ items, ItemComponent }) {
  return <ul className={css.zigZagList}>
    {items.map((item, i) =>
      <ListItem key={i} i={i} item={item}>
        <ItemComponent item={item} />
      </ListItem>
    )}
  </ul>;
};

export default ZigZagList;