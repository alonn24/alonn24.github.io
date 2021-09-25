import { useColorModeValue } from "@chakra-ui/color-mode";
import { Image } from "@chakra-ui/react";
import { Box } from "@chakra-ui/layout";
import css from './Hero.module.css';

function Hero(props) {
  const gardiend = useColorModeValue(
    "linear(to-r, primary.500, primary.300)",
    "linear(to-r, secondary.500, secondary.500)"
  );
  return <Box bgGradient={gardiend} display={{ md: 'flex' }} className={css.hero} {...props} >
    <picture>
      <source srcset="images/hero-s.webp" type="image/webp" media="(max-width: 500px)"  />
      <source srcset="images/hero-md.webp" type="image/webp" media="(max-width: 768px)"  />
      <source srcset="images/hero-xl.webp" type="image/jpeg"  />
      <Image srcSet="images/hero-s.jpg 500w,
        images/hero-m.jpg 768w,
        images/hero-xl.jpg 1024w"
        sizes="(max-width: 500px) 500px,
            (max-width: 768px) 768px,
            1024px"
        src="images/hero-m.jpg"
        width="100%"
        height="100%"
        alt="Hero image"
        objectFit="cover"
        objectPosition="top right"
        className={css.heroImage}
         />
    </picture>

    {props.children}
  </Box>
}

export default Hero;