import sys
import shutil
import tensorflow as tf
from keras.layers import K
sys.path.append('../keras/')
from keras.models import load_model


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
shutil.rmtree('./export', ignore_errors=True)
model = load_model('../keras/data/trained_model.h5')
export_to_tf(model, "export")
