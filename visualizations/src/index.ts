import simpleDiagram from "./gojs/simple-diagram";
import htmlDataBinding from "./d3/html-data-binding";
import svgGraphics from "./d3/svg-graphics";

window.addEventListener('load', () => simpleDiagram('go-js-root'));

htmlDataBinding('d3-html-data-binding');
svgGraphics('d3-svg-graphics');
