terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# S3 bucket (name must be globally unique!)
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = merge(
    var.tags,
    {
      Environment = var.environment
      Name        = "${var.name_prefix}-${var.environment}-bucket"
    }
  )
}

# Optional: block public access (recommended)
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
