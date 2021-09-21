import css from './Experience.module.css'
import experience from '../../content/experience.json';
import Timeline from '../layout/Timeline';

function Description({ description }) {
  if (typeof description === 'string') {
    return description;
  }
  if (Array.isArray(description)) {
    return <ul className={css.descriptionList}>{description.map(x => <li><Description description={x} /></li>)}</ul>
  }
  return null;
}

function ItemComponent({ item }) {
  return <>
    <li>Company: {item.company}</li>
    <li>Title: {item.title}</li>
    <li>Start: {item.start}</li>
    <li>End: {item.end}</li>
    <li>Description: <Description description={item.description} /></li>
    {item.timeline && <Timeline items={item.timeline} ItemComponent={ItemComponent} />}
  </>;
}

function Experience() {
  const { timeline } = experience;
  return <Timeline items={timeline} ItemComponent={ItemComponent} />;
}

export default Experience;