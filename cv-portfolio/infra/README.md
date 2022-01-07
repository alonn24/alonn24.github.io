terraform init
terraform import aws_s3_bucket.b alony-cv-static
aws s3 sync build s3://alony.info/50b178324a00bb8eec21e3f74441abd16c0d4342