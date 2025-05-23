variable "vpc_id" {
  description = "VPC ID onde o RDS será provisionado"
  type        = string
}

variable "security_group_name" {
  description = "Nome do security group do RDS"
  type        = string
  default     = "rds-prod-securitygroup"
}
