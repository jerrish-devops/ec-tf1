variable "access_key" {
  
}

variable "secret_key" {
  
}

variable "ami" {
  description = "This is amazon linux instance image"
  default = "ami-0645cf88151eb2007"
}

variable "instance_type" {
  description = "This is a free tier instance type"
  default = "t2.micro"
}

variable "allow_specific" {
  description = "This allows corp dc to access ec2 instance"
  default = "1.1.1.1/32"
}