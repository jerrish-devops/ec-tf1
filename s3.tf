resource "aws_s3_bucket" "demo_bucket1" {
  bucket = var.s3_var[0]
  force_destroy = var.s3_var[1]
  tags = {
    Name = "testing-bucket"
  }
}

/*
resource "aws_s3_bucket" "demo_bucket2" {
  bucket = "jerrish-tf-class-singapore12"
  force_destroy = true
  tags = {
    Name = "testing-bucket"
  }
  provider = aws.account1-singapore
}
*/