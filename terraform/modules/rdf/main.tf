resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-db-subnet-group"
  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "postgres" {
  identifier              = "${var.name}-postgres"
  engine                  = "postgres"
  engine_version          = "15"
  instance_class          = "db.t3.medium"
  allocated_storage       = 50
  storage_encrypted       = true
  multi_az                = true
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [var.db_sg_id]
  backup_retention_period = 7
  skip_final_snapshot     = false
  deletion_protection     = true

  publicly_accessible = false
}