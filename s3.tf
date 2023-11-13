resource "aws_s3_bucket" "demo_bucket" {
  bucket = "jerrish-tf-class"
  force_destroy = true
  tags = {
    Name = "testing-bucket"
  }
}