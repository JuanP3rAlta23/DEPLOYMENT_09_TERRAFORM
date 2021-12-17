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
  db_subnet_group_name   = aws_db_subnet_group.internals-db.id
}

resource "aws_db_subnet_group" "internals-db" {
  name       = "internals-db"
  subnet_ids = [aws_subnet.internal1.id, aws_subnet.internal2.id]

  tags = {
    Name = "DB-subnet-group"
  }
}