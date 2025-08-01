# f. outputs.tf File
output "bucket_website_endpoint" {
  value = aws_s3_bucket_website_configuration.tomkewebsite_config.website_endpoint
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.website_distribution.domain_name
}
