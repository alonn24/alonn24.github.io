# Create and upload a bucket
gsutil mb -l us-central1 gs://alonn24-keras-tutorial
gsutil cp -R export/* gs://alonn24-keras-tutorial/tutorial_v1

# Create a model and place in the bucket
gcloud ml-engine models create tutorial --regions us-central1
gcloud ml-engine versions create v1 --model=tutorial --origin=gs://alonn24-keras-tutorial/tutorial_v1

# Predict
gcloud ml-engine predict --model=tutorial --json-instances=data/proposed_new_product.json