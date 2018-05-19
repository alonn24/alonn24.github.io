import numpy as np
from keras.preprocessing import image
from keras.applications import resnet50

# Load Keras' ResNet50 model that was pre-trained against the ImageNet database
model = resnet50.ResNet50()


def predict(img):
  print("{}:".format(img))
  # Load the image file, resizing it to 224x224 pixels (required by this model)
  img_df = image.load_img(img, target_size=(224, 224))
  x = image.img_to_array(img_df)  # [row[columns[r, g, b]]]
  x = np.expand_dims(x, axis=0)  # array of images

  # Scale and predict
  predictions = model.predict(resnet50.preprocess_input(x))
  predicted_classes = resnet50.decode_predictions(predictions, top=5)
  for imagenet_id, name, likelihood in predicted_classes[0]:
    print(" - {}: {:2f} likelihood".format(name, likelihood))
  print("\n")


predict("image-recognition/bay.jpg")
predict("image-recognition/selfie-portrait.png")
predict("image-recognition/vacation.jpg")
predict("image-recognition/flag.jpg")
