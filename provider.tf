terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.24.0"
    }
  }
  required_version = "1.6.3"
}

provider "aws" {

}

resource "aws_instance" "demo_instance1" {
  ami = "ami-0645cf88151eb2007"
  instance_type = "t2.micro"
}