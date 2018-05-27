import tensorflow as tf


def zero_weights(name, prev, to): return tf.get_variable(name=name, shape=[prev, to],
                                                         initializer=tf.contrib.layers.xavier_initializer())


def zero_biases(name, nodes): return tf.get_variable(name=name, shape=[nodes], initializer=tf.zeros_initializer())


class TFModel:
  def __init__(self, X, Y, cost, optimizer, prediction, summary):
    self.X = X
    self.Y = Y
    self.cost = cost
    self.optimizer = optimizer
    self.prediction = prediction
    self.summary = summary


def create():
  with tf.variable_scope('input'):
    X = tf.placeholder(tf.float32, shape=(None, 9))

  with tf.variable_scope('layer_1'):
    weights = zero_weights('weights1', 9, 50)
    biases = zero_biases('biases1', 50)
    layer_1_output = tf.nn.relu(tf.matmul(X, weights) + biases)

  with tf.variable_scope('layer_2'):
    weights = zero_weights('weights2', 50, 100)
    biases = zero_biases('biases2', 100)
    layer_2_output = tf.nn.relu(tf.matmul(layer_1_output, weights) + biases)

  with tf.variable_scope('layer_3'):
    weights = zero_weights('weights3', 100, 50)
    biases = zero_biases('biases3', 50)
    layer_3_output = tf.nn.relu(tf.matmul(layer_2_output, weights) + biases)

  with tf.variable_scope('output'):
    weights = zero_weights('weights4', 50, 1)
    biases = zero_biases('biases4', 1)
    prediction = tf.matmul(layer_3_output, weights) + biases  # predicted value

  # const/loss function - distance from the right prediction
  with tf.variable_scope('cost'):
    Y = tf.placeholder(tf.float32, shape=(None, 1))  # will hold the real value
    cost = tf.reduce_mean(tf.squared_difference(prediction, Y))

  # set optimizer to reduce the const function
  with tf.variable_scope('train'):
    optimizer = tf.train.AdamOptimizer(0.001).minimize(cost)

  with tf.variable_scope('logging'):
    tf.summary.scalar('current_cost', cost)
    summary = tf.summary.merge_all()

  return TFModel(X, Y, cost, optimizer, prediction, summary)


def train(session, model, df, value):
  X = df.drop(value, axis=1).values
  Y = df[[value]].values
  session.run(tf.global_variables_initializer())

  training_writer = tf.summary.FileWriter('./logs/training', session.graph)

  for epoch in range(50):
    session.run(model.optimizer, feed_dict={model.X: X, model.Y: Y})
    training_cost, training_summary = session.run([model.cost, model.summary], feed_dict={model.X: X, model.Y: Y})
    training_writer.add_summary(training_summary, epoch)
    print('Epoch {}/50\n  loss: {:2f}'.format(epoch, training_cost))


def error_rate(session, model, testing_data_df, value):
  X = testing_data_df.drop(value, axis=1).values
  Y = testing_data_df[[value]].values
  return session.run(model.cost, feed_dict={model.X: X, model.Y: Y})
