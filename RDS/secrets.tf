resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "nishu3456"
}

resource "aws_secretsmanager_secret" "testsecret" {
  name                    = "rds_admin9891"
  kms_key_id              = aws_kms_key.testkey.id
  description             = "rds_admin_password"
  recovery_window_in_days = 14

  tags = {
    Name = "rds_secret_password"
  }
  depends_on = [aws_kms_key.testkey]
}

resource "aws_secretsmanager_secret_version" "testversion" {
  secret_id     = aws_secretsmanager_secret.testsecret.id
  secret_string = random_password.password.result
}