<!-- src/components/WebCam.vue -->
<!-- This is an alternative way to define the Hello component using decorators -->
<template>
  <div>
    <video autoplay playsinline muted id="webcam" width="500" height="500" class="board" style="object-fit: fill;"></video>
    <canvas id='overlay' width="500" height="500" class="board"></canvas>
  </div>
</template>

<script lang="ts">
  import { Vue, Component } from "vue-property-decorator";
  import { capture, initWebcam } from "../webcam/webcam";
  import predictPosenet from "../posenet/posenet";
  @Component
  export default class Main extends Vue {
    mounted() {
      const webcam = this.$el.querySelector('#webcam');
      const overlay = this.$el.querySelector('#overlay');
      initWebcam(webcam);

      async function loopPosenet() {
        await predictPosenet(capture(webcam), overlay);
        requestAnimationFrame(loopPosenet);
      }
      loopPosenet()
    }

  }
</script>

<style lang="css">
  .board {
    position: absolute;
    left: 0;
    top: 0;
    width: 100vw;
    height: 100vh;
  }
</style>
