#This resource creates an ec2 amazon linux instance in mumbai region
resource "aws_instance" "demo_instance1" {
  ami           = "ami-0645cf88151eb2007"
  instance_type = "t2.micro" 
  key_name      = "awsclass-mumbai-kp"             #this key must exist in mumbai region
  tags = {
    Name    = "linux-webserver-mumbai"
    Project = "projecta"
  }
  subnet_id              = aws_subnet.demo_subnet_public1.id
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