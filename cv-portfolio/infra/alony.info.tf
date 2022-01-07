provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "alony-cv-static"
  tags   = {}
  acl    = "public-read"
    policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
      {
          "Sid": "AddPerm",
          "Effect": "Allow",
          "Principal": "*",
          "Action": [
             "s3:GetObject"
          ],
          "Resource": [
             "arn:aws:s3:::alony-cv-static/*"
          ]
      }
    ]
}
POLICY
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}