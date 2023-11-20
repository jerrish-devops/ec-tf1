resource "aws_s3_bucket" "demo_bucket1" {
  bucket = "jerrish-tf-class-mumbai"
  force_destroy = true
  tags = {
    Name = "testing-bucket"
  }
}

resource "aws_s3_bucket" "demo_bucket2" {
  bucket = "jerrish-tf-class-singapore12"
  force_destroy = true
  tags = {
    Name = "testing-bucket"
  }
  provider = aws.account1-singapore
}