import * as posenet from '@tensorflow-models/posenet';

const scaleFactor = 0.50;
const flipHorizontal = false;
const outputStride = 16;

export default async function(mediaElement, canvas) {
  const context = canvas.getContext('2d');
  const net = await posenet.load();
  const pose = await net.estimateSinglePose(mediaElement, scaleFactor, flipHorizontal, outputStride);
  const eyes = pose.keypoints.filter(x => x.part.toLowerCase().indexOf('eye') >= 0);
  
  context.clearRect(0, 0, canvas.width, canvas.height);
  context.strokeStyle = 'orange';
  eyes.forEach(eye => {
    context.beginPath();
    context.arc(eye.position.x, eye.position.y, 5, 0, 2 * Math.PI, true);
    context.stroke();
  });
}