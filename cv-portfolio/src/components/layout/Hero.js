import { useColorModeValue } from "@chakra-ui/color-mode";
import { Image } from "@chakra-ui/react";
import { Box } from "@chakra-ui/layout";
import css from './Hero.module.css';
import heroMDWebP from './hero-images/hero-md.webp';
import heroSWebP from './hero-images/hero-s.webp';
import heroXLWebP from './hero-images/hero-xl.webp';
import heroMD from './hero-images/hero-md.jpg'

function Hero(props) {
  const gardiend = useColorModeValue(
    "linear(to-r, primary.500, primary.300)",
    "linear(to-r, secondary.500, secondary.500)"
  );
  return <Box bgGradient={gardiend} display={{ md: 'flex' }} className={css.hero} {...props} >
    <picture>
      <source srcset={heroSWebP} type="image/webp" media="(max-width: 500px)"  />
      <source srcset={heroMDWebP} type="image/webp" media="(max-width: 768px)"  />
      <source srcset={heroXLWebP} type="image/webp"  />
      <Image srcSet={`${heroSWebP} 500w
        ${heroMDWebP} 768w,
        ${heroXLWebP} 1024w`}
        sizes="(max-width: 500px) 500px,
            (max-width: 768px) 768px,
            1024px"
        // src={heroMD}
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