#This resource creates an ec2 amazon linux instance
resource "aws_instance" "demo_instance1" {
  ami           = "ami-0645cf88151eb2007"
  instance_type = "t2.micro" 
  key_name      = "tfclass-mumbai-kp"             #this key exist in mumbai region only
  tags = {
    Name    = "linux-webserver"
    Project = "projecta"
  }
  subnet_id              = "subnet-0453673da9a08bfd1"
  vpc_security_group_ids = ["sg-0f17b7be16cedabbe"]
}