import '@webcomponents/webcomponentsjs/webcomponents-loader';
import './polymer/polymer-word-count'

import './word-count/word-count';
import { observable } from 'mobx';
import { observer } from 'mobx-react';

import * as React from 'react';
import * as ReactDOM from 'react-dom';

declare global {
  namespace JSX {
    interface IntrinsicElements {
      'word-count': any
      'polymer-word-count': any
    }
  }
}

class AppState {
  @observable wordCount = 'word count';
}

@observer
class ReactWordCount extends React.Component<any, any> {
  updateProperty = (event) => {
    this.props.appState.wordCount = event.target.value;
  };

  render() {
    return (
      <div>
        <div className='title'>Web Components</div>
        <input value={ this.props.appState.wordCount } onChange={this.updateProperty}/>
        <word-count text={ this.props.appState.wordCount }>
          <span slot='title'>Word Count:</span>
          Light DOM Content
        </word-count>
        <polymer-word-count text={ this.props.appState.wordCount }>
          <span slot='title'>Polymer Word Count:</span>
          Light DOM Content
        </polymer-word-count>
      </div>
    );
  }
}

const appState = new AppState();
ReactDOM.render(
  <ReactWordCount appState={ appState }></ReactWordCount>,
  document.getElementById('root')
);


