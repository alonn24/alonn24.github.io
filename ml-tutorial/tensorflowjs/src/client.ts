import predictKeras from './keras/keras';
(window as any).predictKeras = predictKeras;

// client-entry
import Vue from 'vue';
import App from './components/app.vue';

const VueApp = Vue.extend(App);
new VueApp({
  el: '.my-app',
});
