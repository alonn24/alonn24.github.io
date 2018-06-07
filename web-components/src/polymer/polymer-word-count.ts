import { PolymerElement } from '@polymer/polymer/polymer-element.js';

export class PolymerWordCount extends PolymerElement {
  constructor() {
    super();
  }

  static get is() {
    return 'polymer-word-count';
  }

  static get properties() {
    return {
      text: {
        type: String,
        observer: '_textChanged'
      },
      textCount: {
        type: Number,
        computed: '_textCount(text)'
      }
    }
  }

  _textCount(text) {
    return text.trim().split(' ').length;
  }

  _textChanged(newValue, oldValue) {
    this.logToComponent(`attributeChangedCallback: ${name} from "${oldValue}" to "${newValue}"`);
  }

  ready() {
    super.ready();
    this.logToComponent('ready');
  }

  connectedCallback() {
    super.connectedCallback();
    this.logToComponent('connectedCallback');
  }

  get me():HTMLElement {
    return <any>this;
  }

  private logToComponent(text) {
    const span = document.createElement('div');
    span.innerHTML = text;
    const log = this.me.shadowRoot.querySelector('.log') as HTMLElement;
    log.appendChild(span);
  }
}

customElements.define(PolymerWordCount.is, PolymerWordCount);
