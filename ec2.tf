#generate ssh key pair
resource "tls_private_key" "rsa-4096-example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

#import the public key to aws
resource "aws_key_pair" "demo_pub_key" {
  key_name = "terraform-key"
  public_key = tls_private_key.rsa-4096-example.public_key_openssh
}

#store private key locally
resource "local_file" "foo" {
  content  = tls_private_key.rsa-4096-example.private_key_openssh
  filename = "terraform-key.pem"
}

#This resource creates an ec2 amazon linux instance in mumbai region
resource "aws_instance" "demo_instance1" {
  ami           = var.ami["amazon"]
  instance_type = var.instance_type[2]
  key_name      = aws_key_pair.demo_pub_key.key_name             
  tags = var.instance_tag
  subnet_id              = aws_subnet.demo_subnet_public1.id
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
}

#This resource creates an ec2 amazon linux instance in singapore region
/*
resource "aws_instance" "demo_instance2" {
  ami           = "ami-02453f5468b897e31"
  instance_type = "t2.micro" 
  tags = {
    Name    = "linux-webserver-singapore"
    Project = "projecta"
  }
  provider = aws.account1-singapore
}
*/