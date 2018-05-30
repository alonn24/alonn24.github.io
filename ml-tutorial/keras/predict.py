import sys
import json
import pandas as pd
from keras.models import load_model

sys.path.append('../utils/')
model = load_model('data/trained_model.h5')

with open('data/trained_model_conf.json') as f:
  trained_model_conf = json.load(f)

# Predict
products = pd.read_csv('data/proposed_new_products.csv').values
predictions = model.predict(products)
for prediction in predictions:
  prediction = prediction[0]
  prediction = prediction + trained_model_conf['adding']
  prediction = prediction / trained_model_conf['multiplying']
  print('Earnings Prediction for Proposed Product - ${}'.format(prediction))
