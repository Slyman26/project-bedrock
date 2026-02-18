terraform {
  backend "s3" {
    bucket         = "barakat-tfstate-0938-backend"
    key            = "project-bedrock/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "barakat-tfstate-lock"
    encrypt        = true
  }
}
