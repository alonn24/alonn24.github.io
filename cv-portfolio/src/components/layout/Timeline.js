import css from './Timeline.module.css'
function Timeline({ items, ItemComponent }) {
  return <ul className={css.timeline}>
    {items.map((item, i) => <li key={i}>
      <ItemComponent item={item} />
    </li>)}
  </ul>;
};

export default Timeline;