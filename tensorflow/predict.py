import sys
import tensorflow as tf
import pandas as pd
import model_api

sys.path.append('../utils/')
import input_api

NUM_NODES = 50
RUN_NAME = '{} nodes'.format(NUM_NODES)

df, multiplying, adding = input_api.read_df("data/sales_data_training.csv", True)
model = model_api.create(NUM_NODES)
saver = tf.train.Saver()

with tf.Session() as session:
  saver.restore(session, "data/trained_model.ckpt")
  product = pd.read_csv("data/proposed_new_product.csv").values
  predictions = session.run(model.prediction, feed_dict={model.X: product})
  for prediction in predictions:
    prediction = prediction[0]
    prediction = prediction + adding
    prediction = prediction / multiplying
    print(prediction)

