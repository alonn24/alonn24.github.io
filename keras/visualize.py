import seaborn as sns
import matplotlib.pyplot as plt
from keras.models import load_model
import input_api

training_data_df, _, _ = input_api.read("data/sales_data_training.csv", True)
model = load_model('data/trained_model.h5')

sns.clustermap(training_data_df)
plt.show()