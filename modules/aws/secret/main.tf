resource "random_uuid" "encryption_key" {
}

resource "aws_secretsmanager_secret" "nullservice_params_encryption" {
  name = "nullservice/params-${var.name}"

  force_overwrite_replica_secret = true
  recovery_window_in_days        = 0

}

resource "aws_secretsmanager_secret_version" "encryption_key" {
  secret_id     = aws_secretsmanager_secret.nullservice_params_encryption.id
  secret_string = <<EOF
        {
          "encryption_key": "${random_uuid.encryption_key.result}"
        }
        EOF
}
