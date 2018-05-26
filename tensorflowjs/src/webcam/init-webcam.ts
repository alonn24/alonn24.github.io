export default function initWebcam(videoElement) {
  const nav = navigator as any;
  nav.getMedia = (nav.getUserMedia || nav.webkitGetUserMedia || nav.mozGetUserMedia);

  nav.getMedia(
    // constraints
    { video: true, audio: false },

    // success callback
    function(mediaStream) {
      videoElement.src = window.URL.createObjectURL(mediaStream);
      videoElement.play();
    },
    //handle error
    function(error) {
      console.log(error);
    })
}