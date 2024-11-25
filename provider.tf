terraform {
 backend "s3" {
 bucket = "shivangiest1024"
 key = "globalstate/s3/terraform.tfstate"
 region = "us-east-1"
 # Replace this with your DynamoDB table name!
 dynamodb_table = "Shivangi-902903July-dblocks"
 encrypt = true
 }
}


provider "aws" {
  region = "us-east-1"
}
