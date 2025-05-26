provider "aws" {
  region = "us-east-1" 
}

data "aws_availability_zones" "available" {}

resource "aws_security_group" "sg-rds-fiaptech" {
  name   = var.security_group_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project     = "rms"
    Terraform   = "true"
    Environment = "prod"
  }
  lifecycle {
  prevent_destroy = true
}
}

resource "aws_db_instance" "db-rds-fiaptech" {
  identifier              = "rds-fiaptech"
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "postgres"
  engine_version          = "17"
  instance_class          = "db.t3.micro"
  username                = "pgadmin"
  password                = var.db_password
  publicly_accessible     = false
  skip_final_snapshot     =  true
  vpc_security_group_ids  = [aws_security_group.sg-rds-fiaptech.id]

lifecycle {
  prevent_destroy = true
}
}


