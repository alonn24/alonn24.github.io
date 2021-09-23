import css from './ZigZagList.module.css'

function ZigZagTimeLine({ items, ItemComponent }) {
  return <ul className={css.zigZagList}>
    {items.map((item, i) => <li className={i % 2 ? css.listItemAlt : css.listItem}>
      <ItemComponent item={item} />
    </li>)}
  </ul>;
};

export default ZigZagTimeLine;