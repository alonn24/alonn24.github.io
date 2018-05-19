import pandas as pd
import keras
from keras.models import load_model
import model_api
import input_api

NUM_NODES = 50
RUN_NAME = '{} nodes'.format(NUM_NODES)
logger = keras.callbacks.TensorBoard(  # Create a TensorBoard logger
    log_dir='logs/{}'.format(RUN_NAME),
    write_graph=True,
    histogram_freq=0  # 5 without tensorBoard
)

model = model_api.create(NUM_NODES)
training_data_df, _, _ = input_api.read("data/sales_data_training.csv", True)
model_api.train(model, training_data_df, 'total_earnings', logger)
model_api.export_to_tf(model, "export")

testing_data_df, multiplying, adding  = input_api.read("data/sales_data_test.csv")
test_error_rate = model_api.error_rate(model, testing_data_df)
print("The mean squared error (MSE) for the test data set is: {}".format(test_error_rate))

# Save and Load the model to disk (optional)
model.save("data/trained_model.h5")
model = load_model('data/trained_model.h5')

# Predict
product = pd.read_csv("data/proposed_new_product.csv").values
prediction = model.predict(product)
prediction = prediction[0][0]
prediction = prediction + adding
prediction = prediction / multiplying
print("Earnings Prediction for Proposed Product - ${}".format(prediction))
