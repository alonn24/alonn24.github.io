import * as tf from '@tensorflow/tfjs';
import load from "../utils/load";

export default async function () {
  const products = await load('./data/proposed_new_products.json');
  const model = await tf.loadModel('data/trained_model/model.json');
  const modelConf = await load('data/trained_model_conf.json');
  const tensors: any = model.predict(tf.tensor2d(products));

  for (let i = 0; i < tensors.size; i++) {
    let prediction = tensors.get(i, 0);
    console.log('prediction', (prediction + modelConf.adding) / modelConf.multiplying);
  }
}