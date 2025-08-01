# Provider
provider "aws" {
  region = "eu-central-1"
}

# Bucket
resource "aws_s3_bucket" "tomkewebsite" {
  bucket = "tomkewebsitebucket"

  tags = {
    Name        = "Portfolio Website"
    Environment = "Production"
  }
}

# Public Access Block
resource "aws_s3_bucket_public_access_block" "tomkewebsite_access" {
  bucket = aws_s3_bucket.tomkewebsite.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Policy
resource "aws_s3_bucket_policy" "website_policy" {
  bucket = aws_s3_bucket.tomkewebsite.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.tomkewebsite.arn}/*"
      }
    ]
  })
}

# Website Configuration
resource "aws_s3_bucket_website_configuration" "tomkewebsite_config" {
  bucket = aws_s3_bucket.tomkewebsite.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}
