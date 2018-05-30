import sys
import tensorflow as tf
import model_api

sys.path.append('../utils/')
import input_api

df, multiplying, adding = input_api.read_df('data/sales_data_training.csv', True)
model = model_api.create()
saver = tf.train.Saver()

with tf.Session() as session:
  model_api.train(session, model, df, 'total_earnings')

  testing_data_df, _, _ = input_api.read_df('data/sales_data_test.csv')
  test_error_rate = model_api.error_rate(session, model, testing_data_df, 'total_earnings')
  print('The mean squared error (MSE) for the test data set is: {:2f}'.format(test_error_rate))

  save_path = saver.save(session, 'data/trained_model.ckpt')
  print('Model saved: {}'.format(save_path))
