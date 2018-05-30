import { overrideConsole } from "./logger";
import predictKeras from "./keras/keras";
import predictPosenet from "./posenet/posenet";
import { initWebcam, capture } from "./webcam/webcam";

const webcam = document.getElementById('webcam');
const overlay = document.getElementById('overlay');

initWebcam(webcam);
overrideConsole('#log');

async function loopPosenet() {
  await predictPosenet(capture(webcam), overlay);
  requestAnimationFrame(loopPosenet);
}

(window as any).predictKeras = predictKeras;
(window as any).predictPosenet = () => loopPosenet();
