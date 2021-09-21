import css from './Timeline.module.css'
function TimeLine({ items, ItemComponent }) {
  return <ul className={css.timeline}>
    {items.map(item => <li>
      {/* <span className={css.timelineLine} /> */}
      <ItemComponent item={item} />
    </li>)}
  </ul>;
};

export default TimeLine;