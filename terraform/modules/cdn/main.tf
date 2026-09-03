resource "aws_cloudfront_origin_access_control" "website" {
  name                              = var.origin_access_control_name
  description                       = "Access control for the portfolio S3 bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

data "aws_cloudfront_cache_policy" "caching_optimized" {
  name = "Managed-CachingOptimized"
}

resource "aws_cloudfront_distribution" "website" {
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = var.default_root_object
  comment             = var.distribution_comment

  origin {
    domain_name              = var.bucket_regional_domain_name
    origin_id                = "s3-${var.bucket_id}"
    origin_access_control_id = aws_cloudfront_origin_access_control.website.id
  }

  default_cache_behavior {
    target_origin_id       = "s3-${var.bucket_id}"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = [
      "GET",
      "HEAD",
      "OPTIONS"
    ]

    cached_methods = [
      "GET",
      "HEAD"
    ]

    cache_policy_id = data.aws_cloudfront_cache_policy.caching_optimized.id
    compress        = true
  }

  custom_error_response {
    error_code            = 403
    response_code         = 404
    response_page_path    = var.error_response_page_path
    error_caching_min_ttl = 60
  }

  custom_error_response {
    error_code            = 404
    response_code         = 404
    response_page_path    = var.error_response_page_path
    error_caching_min_ttl = 60
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-cdn"
    }
  )
}

data "aws_iam_policy_document" "website_access" {
  statement {
    sid    = "AllowCloudFrontReadOnly"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${var.bucket_arn}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"

      values = [
        aws_cloudfront_distribution.website.arn
      ]
    }
  }
}

resource "aws_s3_bucket_policy" "website_access" {
  bucket = var.bucket_id
  policy = data.aws_iam_policy_document.website_access.json
}
