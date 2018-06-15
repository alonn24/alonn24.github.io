import predictKeras from "./keras/keras";
(window as any).predictKeras = predictKeras;

import Vue from "vue";
import MainComponent from "./components/main.vue";
new Vue({
  el: "#app",
  template: `<main-component/>`,
  components: {
    MainComponent
  }
});
