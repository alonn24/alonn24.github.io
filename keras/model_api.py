from keras.layers import K
from keras.models import Sequential
from keras.layers import Dense
import tensorflow as tf


def create(numOfNodes):
    model = Sequential()
    model.add(Dense(numOfNodes, input_dim=9, activation='relu', name='layer_1'))
    model.add(Dense(100, activation='relu', name='layer_2'))
    model.add(Dense(50, activation='relu', name='layer_3'))
    model.add(Dense(1, activation='linear', name='output_layer'))
    model.compile(loss='mean_squared_error', optimizer='adam')
    return model


def train(model, df, value, logger):
    X = df.drop(value, axis=1).values
    Y = df[[value]].values
    model.fit(X, Y, epochs=50, shuffle=True, verbose=2, callbacks=[logger])


def export_to_tf(model, to):
    model_builder = tf.saved_model.builder.SavedModelBuilder(to)
    inputs = {
        'input': tf.saved_model.utils.build_tensor_info(model.input)
    }
    outputs = {
        'earnings': tf.saved_model.utils.build_tensor_info(model.output)
    }

    signature_def = tf.saved_model.signature_def_utils.build_signature_def(
        inputs=inputs,
        outputs=outputs,
        method_name=tf.saved_model.signature_constants.PREDICT_METHOD_NAME
    )

    model_builder.add_meta_graph_and_variables(
        K.get_session(),
        tags=[tf.saved_model.tag_constants.SERVING],
        signature_def_map={
            tf.saved_model.signature_constants.DEFAULT_SERVING_SIGNATURE_DEF_KEY: signature_def
        }
    )

    model_builder.save()


def error_rate(model, testing_data_df):
    X_test = testing_data_df.drop('total_earnings', axis=1).values
    Y_test = testing_data_df[['total_earnings']].values
    return model.evaluate(X_test, Y_test, verbose=0)
