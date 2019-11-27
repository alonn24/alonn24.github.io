import * as go from 'gojs';
import { nodeTypes, linkTypes } from "./nodes-creator";

const $ = go.GraphObject.make;

// Nodes
const branchTemplate = $(go.Node, 'Auto',
  new go.Binding('location', 'loc'),
  $(go.Shape, 'RoundedRectangle', new go.Binding('fill', 'color')),
  $(go.TextBlock, 'text', new go.Binding('margin', 'spacing'), new go.Binding('text', 'text'))
);

const nodeTemplate = $(go.Node, 'Auto',
  $(go.Shape, 'Circle', new go.Binding('fill', 'color')),
  $(go.TextBlock, new go.Binding('margin', 'spacing'), new go.Binding('text', 'text'))
);

const commentTemplate = $(go.Node, 'Auto',
  $(go.TextBlock, new go.Binding('stroke', 'color'), new go.Binding('text', 'text'))
);

export const nodesTemplates = new go.Map('string', go.Node);
nodesTemplates.add(nodeTypes.branch, branchTemplate);
nodesTemplates.add(nodeTypes.node, nodeTemplate);
nodesTemplates.add(nodeTypes.comment, commentTemplate);

// Links

const linkTemplate = $(go.Link,
  $(go.Shape, { strokeWidth: 1 }, new go.Binding('stroke', 'color')),
  $(go.Shape, { toArrow: 'Standard', stroke: 'null' }, new go.Binding('fill', 'color')),
);

const commentLinkTemplate = $(go.Link,
  $(go.Shape, { strokeWidth: 1 }, new go.Binding('stroke', 'color'))
);

export const linksTemplates = new go.Map('string', go.Link);
linksTemplates.add(linkTypes.link, linkTemplate);
linksTemplates.add(linkTypes.comment, commentLinkTemplate);
// nodesTemplates.add(nodeCategory.node, nodeTemplate);
