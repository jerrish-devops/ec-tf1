output "instance_public_dns_address" {
  value = "This is public DNS - ${aws_instance.demo_instance1.public_dns}"
}