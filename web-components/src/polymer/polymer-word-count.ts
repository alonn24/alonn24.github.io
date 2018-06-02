import { PolymerElement, html } from '@polymer/polymer/polymer-element.js';
import {afterNextRender} from '@polymer/polymer/lib/utils/render-status.js';

export class PolymerWordCount extends PolymerElement {
  constructor() {
    super();

    afterNextRender(this, function() {
      console.log('PolymerWordCount: afterNextRender');
    });
  }

  static get template() {
    return html`<span>PolymerWordCount!: </span>`;
  }

  static get properties() {
    return {
      text: {
        type: String
      }
    };
  }

  static get observers() {
    return [ `_textChanged(text.*)` ];
  }

  _textChanged(text) {
    console.log(`PolymerWordCount: _textChanged`, text);
  }

  connectedCallback() {
    super.connectedCallback();
  }

  ready() {
    super.ready();
  }
}

customElements.define('polymer-word-count', PolymerWordCount);
