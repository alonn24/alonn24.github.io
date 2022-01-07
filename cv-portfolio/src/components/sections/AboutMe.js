import React from 'react';
import { Box } from '@chakra-ui/react';
import css from './AboutMe.module.css';
import profile from '../../content/profile.json';
import CustomBadge from '../layout/CustomBadge';

function useFixedHeightForElement() {
  const elemRef = React.useRef();
  React.useEffect(() => {
    const { height } = elemRef.current.getBoundingClientRect();
    elemRef.current.style.height = `${height}px`;
  }, [elemRef]);
  return elemRef;
}

function useTypings(typingText) {
  const elemRef = React.useRef();
  React.useEffect(() => {
    const words = typingText.split(' ');
    words.pop();
    elemRef.current.innerHTML = '';
    let i = 0;
    let handler = async () => {
      if (i >= typingText.length) {
        return;
      }
      elemRef.current.append(typingText[i]);
      const letter = typingText[i];
      const timeout = (letter === '.' && 1000) || (letter === ',' && 500) || 50;
      i++;
      await new Promise(resolve => setTimeout(resolve, timeout));
      handler();
    };
    handler();
    return () => {
      handler = () => null;
    };
  }, [typingText, elemRef]);
  return elemRef;
}

function AboutMe(props) {
  const { aboutMe, skills } = profile;
  const aboutMeBoxRef = useFixedHeightForElement();
  const aboutMeRef = useTypings(aboutMe);

  return <div>
    <Box ref={aboutMeBoxRef}>
      <span ref={aboutMeRef}>{aboutMe}</span>
      <span class={css.cursor}></span>
    </Box>
    <Box my="1rem">
      {skills.map(x => <CustomBadge key={x} me="0.5rem" mb="0.5em">{x}</CustomBadge>)}
    </Box>
  </div>
};

export default AboutMe;