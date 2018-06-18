import * as go from 'gojs';
import { branchNode, commentNode, commitNode, link } from "./nodes-creator";
import { linksTemplates, nodesTemplates } from "./templates";

export default function simpleDiagram(root) {
  const nodes = {
    master: branchNode('master', { loc: go.Point.parse('0 0') }),
    featureBranch: branchNode('feature branch', { loc: go.Point.parse('0 0') }),
    master1: commitNode('1'),
    master2: commitNode('2'),
    mergeCommit: commitNode('3'),
    ft1: commitNode('1'),
    ft2: commitNode('2'),
    start: commentNode('start'),
    end: commentNode('end')
  };

  const $ = go.GraphObject.make;
  const myDiagram = $(go.Diagram, root);

  const nodeDataArray = Object.keys(nodes).map(key => nodes[key]);
  const linkDataArray = [
    link(nodes.master, nodes.master1),
    link(nodes.master1, nodes.master2),
    link(nodes.master2, nodes.mergeCommit),
    link(nodes.master1, nodes.featureBranch),
    link(nodes.featureBranch, nodes.ft1),
    link(nodes.ft1, nodes.ft2),
    link(nodes.ft2, nodes.mergeCommit),
    // commentLink(nodes.start, nodes.master1),
    // commentLink(nodes.end, nodes.ft2)
  ];

  myDiagram.model = new go.GraphLinksModel(nodeDataArray, linkDataArray);
  myDiagram.nodeTemplateMap = nodesTemplates;
  myDiagram.linkTemplateMap = linksTemplates;
  myDiagram.layout = $(go.TreeLayout, { angle: 90 });
  return myDiagram;
}
