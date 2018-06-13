import * as go from 'gojs';

export default function simpleDiagram(root) {
  const $ = go.GraphObject.make;
  const myDiagram = $(go.Diagram, root);
  const nodeDataArray = [
    { key: 'Alpha', color: 'lime' },
    { key: 'Beta', color: 'cyan' },
    { key: 'Zeta', isGroup: true },
    { key: 'Delta', color: 'pink', group: 'Zeta' },
    { key: 'Gamma', color: 'maroon', group: 'Zeta' }
  ];
  const linkDataArray = [
    { to: 'Beta', from: 'Alpha', color: 'red' },
    { to: 'Zeta', from: 'Alpha' },
    { to: 'Zeta', from: 'Beta' }
  ];
  myDiagram.model = new go.GraphLinksModel(nodeDataArray, linkDataArray);

  myDiagram.add($(go.Part, 'Vertical', { background: 'red' },
    $(go.Shape, 'RoundedRectangle', { fill: 'white' }),
    $(go.TextBlock, 'some text', { background: 'lightgray', textAlign: 'left', stretch: go.GraphObject.Fill })
  ));

  myDiagram.nodeTemplate = $(go.Node, 'Auto',
    $(go.Shape, 'RoundedRectangle', { fill: 'white' }, new go.Binding('fill', 'color')),
    $(go.TextBlock, 'text', { margin: 10 }, new go.Binding('text', 'key'))
  );

  myDiagram.linkTemplate = $(go.Link,
    $(go.Shape, { strokeWidth: 3 }, new go.Binding('stroke', 'color')),
    $(go.Shape, { toArrow: 'Standard', stroke: 'null' }, new go.Binding('fill', 'color')),
    $(go.Shape, { fromArrow: 'Standard', stroke: 'null' }, new go.Binding('fill', 'color'))
  );
  return myDiagram;
}
