class WordCount extends HTMLElement {
  constructor() {
    super();

    // Shadow DOM
    const shadow = this.attachShadow({ mode: 'open' });
    const wordCountLink = document.getElementById('word-count-link') as HTMLLinkElement;
    const wordCountFile = wordCountLink.import as any;
    const templateWordCount = wordCountFile.getElementById('template-word-count');
    shadow.appendChild(document.importNode(templateWordCount.content, true));
  }

  static get observedAttributes() {
    return ['text'];
  }

  private updateWordCount() {
    const text = this.getAttribute('text');
    const words = text.trim().split(' ').length;

    const word = this.shadowRoot.querySelector('.word') as HTMLElement;
    const wordCount = this.shadowRoot.querySelector('.word-count') as HTMLElement;
    word.innerText = text;
    wordCount.innerText = '' + words;
  }

  // lifecycle callbacks
  connectedCallback() {
    this.logToComponent('connectedCallback');
  }

  disconnectedCallback() {
    this.logToComponent('disconnectedCallback');
  }

  adoptedCallback() {
    this.logToComponent('adoptedCallback');
  }

  attributeChangedCallback(name, oldValue, newValue) {
    this.logToComponent(`attributeChangedCallback: ${name} from "${oldValue}" to "${newValue}"`);
    this.updateWordCount();
  }

  private logToComponent(text) {
    const span = document.createElement('div');
    span.innerHTML = text;
    const log = this.shadowRoot.querySelector('.log') as HTMLElement
    log.appendChild(span);
  }
}

customElements.define('word-count', WordCount);
