# Terraform variables for Project Bedrock

variable "cluster_name" {
  description = "Name of the EKS cluster"
  default     = "project-bedrock-cluster"
}

variable "vpc_name" {
  description = "Name of the VPC"
  default     = "project-bedrock-vpc"
}

variable "assets_bucket_name" {
  description = "Name of the S3 bucket for assets"
  default     = "bedrock-assets-0938-bk"
}

# CI/CD workflow test comment
