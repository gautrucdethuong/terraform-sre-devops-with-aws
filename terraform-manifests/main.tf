terraform {
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    
    bucket = "terraform-bucket-04-07-2023"
    key    = "terraform-sre//terraform.tfstate"
    region = "ap-southeast-1"
    # For State Locking
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}
