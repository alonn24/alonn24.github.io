export function initWebcam(videoElement) {
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

export function capture(videoElement) {
  const canvas = document.createElement('canvas');
  canvas.width = videoElement.width;
  canvas.height = videoElement.height;
  canvas.getContext('2d').drawImage(videoElement, 0, 0, videoElement.width, videoElement.height);
  return canvas;
}