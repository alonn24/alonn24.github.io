import css from './Timeline.module.css'
function TimeLine({ items, ItemComponent }) {
  return <ul className={css.timeline}>
    {items.map(item => <li>
      <ItemComponent item={item} />
    </li>)}
  </ul>;
};

export default TimeLine;