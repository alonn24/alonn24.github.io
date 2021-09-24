import css from './ZigZagList.module.css'

function ZigZagList({ items, ItemComponent }) {
  return <ul className={css.zigZagList}>
    {items.map((item, i) => <li key={i} className={i % 2 ? css.listItemAlt : css.listItem}>
      <ItemComponent item={item} />
    </li>)}
  </ul>;
};

export default ZigZagList;