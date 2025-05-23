variable "vpc_id" {
  description = "VPC ID onde o RDS será provisionado"
  type        = string
}

variable "security_group_name" {
  description = "Nome do security group do RDS"
  type        = string
}

variable "db_user" {
  description = "User do banco"
  type        = string
}

variable "db_password" {
  description = "Senha do banco"
  type        = string
  sensitive   = true
}
