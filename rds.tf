resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "9.6"
  instance_class       = "db.t2.micro"
  name                 = "Deploy9db"
  multi_az             = true
  username             = "Juan"
  password             = "DaDBPassword"
  skip_final_snapshot  = true
}