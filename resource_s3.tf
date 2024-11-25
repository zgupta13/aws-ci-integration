resource "aws_s3_bucket" "bckt" {
  bucket = var.s3_bucket_name
  force_destroy = true
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.bckt.id

  rule {
    apply_server_side_encryption_by_default {
    sse_algorithm = "AES256"
   }
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.bckt.id
  
  versioning_configuration {
  status = "Enabled"
 }
}



resource "aws_dynamodb_table" "locks" {
  name = "Shivangi-902903July-dblocks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

 attribute {
   name = "LockID"
   type = "S"
 }
}
