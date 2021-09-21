import education from '../../content/education.json';
import Timeline from '../layout/Timeline';

function ItemComponent({ item }) {
  return <>
    <li>{item.organization}</li>
    <li>{item.title}</li>
    <li>{item.start} - {item.end}</li>
  </>;
}

function Education() {
  const { timeline } = education;
  return <Timeline items={timeline} ItemComponent={ItemComponent} />;
};

export default Education;