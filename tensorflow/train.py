import sys
import tensorflow as tf
import model_api

sys.path.append('../utils/')
import input_api

NUM_NODES = 50
RUN_NAME = '{} nodes'.format(NUM_NODES)

df, multiplying, adding = input_api.read_df("data/sales_data_training.csv", True)
model = model_api.create(NUM_NODES)
saver = tf.train.Saver()

with tf.Session() as session:
  model_api.train(session, model, df, "total_earnings")
  save_path = saver.save(session, "data/trained_model.ckpt")
  print("Model saved: {}".format(save_path))
