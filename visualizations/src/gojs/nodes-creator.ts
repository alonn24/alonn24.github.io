let key = 0;
export const nodeTypes = {
  branch: 'branch',
  node: 'node',
  comment: 'comment'
};

export const linkTypes = {
  link: 'link',
  comment: 'comment'
};

export const branchNode = (text, extra = {}) => Object.assign({ key: key++, text }, {
  category: nodeTypes.branch,
  color: 'lightBlue',
  spacing: 10
}, extra);

export const commitNode = (text, extra = {}) => Object.assign({ key: key++, text }, {
  category: nodeTypes.node,
  color: 'lightGray',
  spacing: 5
}, extra);

export const commentNode = (text, extra = {}) => Object.assign({ key: key++, text }, {
  category: nodeTypes.comment,
  color: 'red',
  spacing: 5
}, extra);

export const link = (from, to, extra = {}) => Object.assign({ from: from.key, to: to.key }, {
  category: linkTypes.link
}, extra);

export const commentLink = (from, to, extra = {}) => Object.assign({ from: from.key, to: to.key }, {
  category: linkTypes.comment,
  color: 'red'
}, extra);
