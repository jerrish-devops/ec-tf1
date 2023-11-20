#This resource creates an ec2 amazon linux instance in mumbai region
resource "aws_instance" "demo_instance1" {
  ami           = "ami-0645cf88151eb2007"
  instance_type = "t2.micro" 
  key_name      = "awsclass-mumbai-kp"             #this key must exist in mumbai region
  tags = {
    Name    = "linux-webserver-mumbai"
    Project = "projecta"
  }
  subnet_id              = "subnet-0453673da9a08bfd1"
  vpc_security_group_ids = ["sg-0f17b7be16cedabbe"]
}

#This resource creates an ec2 amazon linux instance in singapore region
resource "aws_instance" "demo_instance2" {
  ami           = "ami-02453f5468b897e31"
  instance_type = "t2.micro" 
  tags = {
    Name    = "linux-webserver-singapore"
    Project = "projecta"
  }
  provider = aws.account1-singapore
}