variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "environment" {
  type        = string
  description = "Environment name like dev/qa/prod"
}

variable "name_prefix" {
  type        = string
  description = "Prefix used for naming"
}

variable "bucket_name" {
  type        = string
  description = "Globally unique S3 bucket name"
}

variable "tags" {
  type        = map(string)
  description = "Common tags"
  default     = {}
}
