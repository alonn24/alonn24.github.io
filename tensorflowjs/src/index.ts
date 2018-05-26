import * as tf from '@tensorflow/tfjs';
import { overrideConsole } from "./logger";
import initWebcam from "./webcam/init-webcam";

async function load(url) {
  const res = await fetch(url);
  return res.json();
}

async function predict() {
  const products = await load('./data/proposed_new_products.json');
  const model = await tf.loadModel('data/trained_model/model.json');
  const modelConf = await load('data/trained_model_conf.json');
  const tensors: any = model.predict(tf.tensor2d(products));

  for (let i = 0; i < tensors.size; i++) {
    let prediction = tensors.get(i, 0);
    console.log('prediction', (prediction + modelConf.adding) / modelConf.multiplying);
  }
}

const webcamElement = document.getElementById('webcam') as HTMLVideoElement;
async function predictWebcam() {
  initWebcam(webcamElement);
  const model = await tf.loadModel('data/resnet50_model/model.json');
  // const example = tf.fromPixels(webcamElement);  // for example
  const canvas = document.createElement('canvas');
  canvas.width = webcamElement.width;
  canvas.height = webcamElement.height;
  canvas.getContext('2d').drawImage(webcamElement, 0, 0, webcamElement.width, webcamElement.height);
  const example = tf.fromPixels(canvas);
  const prediction = model.predict(example);
  console.log(prediction);
}

overrideConsole('#log');
(window as any).predict = predict;
(window as any).predictWebcam = predictWebcam;
