<template>
  <div class="my-app">
    <h1>{{name}}</h1>
    <h2>age: {{age}} <button @click="plus">+1</button></h2>
    <main-component></main-component>
  </div>
</template>

<script lang="ts">
  import MainComponent from './main.vue'
  export default {
    components: {
      MainComponent,
    },
    data() {
      return {
        name: 'Hans',
        age: 0,
      }
    },
    created() {
      console.log('created > ' + this.age);
      ++this.age;
    },
    methods: {
      plus() {
        this.age++;
      },
    },
  };
</script>

<style lang="css">
  .my-app {
    background: #eee;
    padding: 10px;
  }
</style>
