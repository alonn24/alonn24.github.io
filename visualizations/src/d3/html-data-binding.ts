import * as d3 from 'd3';

export default function htmlDataBinding(root) {
  const itemsStyle = [
    { name: 'item 1', color: 'red', width: 200 },
    { name: 'item 2', color: 'blue', width: 100 },
    { name: 'item 3', color: 'green', width: 50 }];
  d3.selectAll(`#${root}`).selectAll('div')
    .data(itemsStyle)
    .enter()
    .append('div')
    .classed('item', true)
    .text(d => d.name)
    .style('color', 'white')
    .style('background', d => d.color)
    .style('width', d => d.width + 'px')
    .exit();
}
