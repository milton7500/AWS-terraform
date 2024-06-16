resource "aws_kms_key" "testkey" {
  description             = "KMS key for RDS"
  deletion_window_in_days = 7
  is_enabled              = true
  enable_key_rotation     = true

  tags = {
    Name = "rds_secret_key"
  }
}