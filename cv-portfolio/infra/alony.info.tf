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

locals {
  s3_origin_id = "alony-cv-static.amazonaws.com"
  s3_origin_path = "/2d527b63b84341aeaeb18f649ba99c5e0a4e38a0"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    origin_id   = local.s3_origin_id
    domain_name = aws_s3_bucket.b.bucket_regional_domain_name
    origin_path = local.s3_origin_path
    connection_attempts = 3
    connection_timeout = 10
  }

  enabled             = true
  is_ipv6_enabled     = true

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    compress = true
    target_origin_id = local.s3_origin_id
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:021468386450:certificate/d75bce37-eb7e-4a91-a968-d3e93d6f561f"
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method = "sni-only"
    cloudfront_default_certificate = false
  }
}