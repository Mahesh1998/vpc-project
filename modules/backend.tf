terraform {
  backend "s3" {
    bucket = var.remote_backend_bucket_name
    key    = var.tfstate_file_name
    dynamodb_table = var.dynamodb_table_state_lock
  }
}