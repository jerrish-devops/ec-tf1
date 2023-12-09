resource "aws_db_instance" "default" {
  allocated_storage    = 10
  identifier = "tf-db-instance"
  db_name              = "students"
  engine               = "mysql"
  engine_version       = "8.0.33"
  instance_class       = "db.t3.micro"
  username             = "jerrish"
  password             = "jerrish123"
  skip_final_snapshot  = true
}