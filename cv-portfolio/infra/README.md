terraform init
terraform import aws_s3_bucket.b alony-cv-static
terraform import aws_cloudfront_distribution.s3_distribution E1Z3HT1LMKQLE7
aws s3 cp --recursive build s3://alony-cv-static/{SHA}