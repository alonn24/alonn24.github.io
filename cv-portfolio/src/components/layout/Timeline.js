import css from './Timeline.module.css'
function TimeLine({ items, ItemComponent }) { 
  return items.map(item => <ul className={css.timeline}>
    <span className={css.timelineLine}/>
    <ItemComponent item={item} />
  </ul>);
};

export default TimeLine;