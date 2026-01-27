resource "aws_s3_bucket" "this" {
  bucket = var.remote_backend.bucket_name

  tags = { name = var.remote_backend.bucket_name }
}