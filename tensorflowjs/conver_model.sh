cp -R ../keras/data ./src
tensorflowjs_converter --input_format=keras ./src/data/trained_model.h5 ./src/data/trained_model