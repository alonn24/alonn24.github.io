import sys
import json
import keras
import model_api

sys.path.append('../utils/')
import input_api

logger = keras.callbacks.TensorBoard(  # Create a TensorBoard logger
  log_dir='logs/50',
  write_graph=True,
  histogram_freq=0  # 5 without tensorBoard
)

model = model_api.create()
training_data_df, multiplying, adding = input_api.read_df('data/sales_data_training.csv', True)
model_api.train(model, training_data_df, 'total_earnings', logger)

testing_data_df, _, _ = input_api.read_df('data/sales_data_test.csv')
test_error_rate = model_api.error_rate(model, testing_data_df, 'total_earnings')
print('The mean squared error (MSE) for the test data set is: {}'.format(test_error_rate))

# Save and Load the model to disk (optional)
model.save('data/trained_model.h5')
print('Model saved: data/trained_model.h5')
with open('data/trained_model_conf.json', 'w') as outfile:
  json.dump({'adding': adding, 'multiplying': multiplying}, outfile)
