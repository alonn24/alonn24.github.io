terraform init
terraform import aws_s3_bucket.b alony-cv-static
terraform import aws_cloudfront_distribution.s3_distribution E1Z3HT1LMKQLE7
aws s3 sync build s3://alony-cv-static/c9f308bce5b045f1c2af1d3efb113b3f3d54a92f