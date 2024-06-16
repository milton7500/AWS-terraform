data "aws_secretsmanager_secret" "testsecret" {
  name = "rds_admin9891"

  depends_on = [aws_secretsmanager_secret.testsecret]
}

data "aws_secretsmanager_secret_version" "name" {
  secret_id = data.aws_secretsmanager_secret.testsecret.id
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb7500"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = data.aws_secretsmanager_secret_version.name.secret_string
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  storage_type         = "gp2"
  tags = {
    Name = "testserver-New"
  }
  publicly_accessible = true
}