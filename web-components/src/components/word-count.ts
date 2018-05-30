export class WordCount extends HTMLParagraphElement {
  constructor() {
    super();

    var shadow = this.attachShadow({mode: 'open'});
    shadow.appendChild(this.createShadowDOM());
    shadow.appendChild(this.createShadowStyle());
  }

  private createShadowDOM() {
    const text = this.getAttribute('text');
    const words = text.split(' ').length;
    const span = document.createElement('span');
    span.innerHTML = `"${text}" has <span class='word-count'>${words}</span> words`;
    return span;
  }

  private createShadowStyle() {
    var style = document.createElement('style');
    style.textContent = '.word-count {color:red;}';
    return style;
  }

  // lifecycle callbacks
  connectedCallback() {
    console.log('Custom square element added to page.');
  }

  disconnectedCallback() {
    console.log('Custom square element removed from page.');
  }

  adoptedCallback() {
    console.log('Custom square element moved to new page.');
  }

  attributeChangedCallback(name, oldValue, newValue) {
    console.log('Custom square element attributes changed.', name, oldValue, newValue);
  }

  static get observedAttributes() {
    console.log('observedAttributes');
    return ['w', 'l'];
  }
}
