terraform {
  backend "s3" {
    bucket         = "vpc-project-remote-backend-bucket"
    key            = "vpc-project.tfstate"
    dynamodb_table = "s3-state-lock"
    region         = "us-east-1"
  }
}