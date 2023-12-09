variable "ami" {
  description = "This is amazon linux instance image"
  default = {
    amazon = "ami-0645cf88151eb2007"
    rhel = "ami-002"
    ubuntu = "ami-003"
  }
  type = map(any)
}

variable "instance_type" {
  type = list(string)
  description = "This is a free tier instance type"
  default = ["t2.nano" , "t2.small" , "t2.micro"]
}

variable "instance_tag" {
  default = {
    Name    = "linux-webserver-mumbai"
    Project = "projecta"
  }
}

variable "allow_specific" {
  description = "This allows corp dc to access ec2 instance"
  default = "1.1.1.1/32"
}

variable "s3_var" {
  default = ["jerrish-tf-class-mumbai" , true]
}