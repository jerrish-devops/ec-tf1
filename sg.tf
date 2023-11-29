resource "aws_security_group" "demo_sg" {
  name        = "tf-vpc-sg"
  description = "allow corp datacenter IP to access the instance"
  vpc_id      = aws_vpc.demo_vpc.id

  ingress {
    description      = "allow ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.allow_specific]
  }

  ingress {
    description      = "allow http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.allow_specific]
  }

  ingress {
    description      = "allow https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.allow_specific]
  }

  ingress {
    description      = "allow nfs"
    from_port        = 2049
    to_port          = 2049
    protocol         = "tcp"
    cidr_blocks      = [var.allow_specific]
  }

  tags = {
    Name = "tf-vpc-sg"
  }
}