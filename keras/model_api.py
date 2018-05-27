from keras.models import Sequential
from keras.layers import Dense


def create():
  model = Sequential()
  model.add(Dense(50, input_dim=9, activation='relu', name='layer_1'))
  model.add(Dense(100, activation='relu', name='layer_2'))
  model.add(Dense(50, activation='relu', name='layer_3'))
  model.add(Dense(1, activation='linear', name='output_layer'))
  model.compile(loss='mean_squared_error', optimizer='adam')
  return model


def train(model, df, value, logger):
  X = df.drop(value, axis=1).values
  Y = df[[value]].values
  model.fit(X, Y, epochs=50, shuffle=True, verbose=2, callbacks=[logger])


def error_rate(model, testing_data_df, value):
  X_test = testing_data_df.drop(value, axis=1).values
  Y_test = testing_data_df[[value]].values
  return model.evaluate(X_test, Y_test, verbose=0)
