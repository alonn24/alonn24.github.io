import * as d3 from 'd3';

export default function svgGraphics(root) {
  const data = [20, 30, 105, 15, 85];

  const height = 400,
    width = 600,
    barWidth = 50,
    barOffset = 5;

  d3.select(`#${root}`)
    .append('svg')
    .attr('width', width)
    .attr('height', height)
    .style('background', '#C9D7D6');
  d3.select('svg').selectAll('rect')
    .data(data)
    .enter().append('rect')
    .style('fill', '#C61C6F')
    .attr('width', barWidth)
    .attr('height', d => d)
    .attr('x', (_d, i) => i * (barWidth + barOffset))
    .attr('y', d => height - d)
    .exit();
}
