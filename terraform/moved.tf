moved {
  from = aws_s3_bucket.website
  to   = module.storage.aws_s3_bucket.website
}

moved {
  from = aws_s3_bucket_public_access_block.website
  to   = module.storage.aws_s3_bucket_public_access_block.website
}

moved {
  from = aws_cloudfront_origin_access_control.website
  to   = module.cdn.aws_cloudfront_origin_access_control.website
}

moved {
  from = aws_cloudfront_distribution.website
  to   = module.cdn.aws_cloudfront_distribution.website
}

moved {
  from = aws_s3_bucket_policy.website_access
  to   = module.cdn.aws_s3_bucket_policy.website_access
}
