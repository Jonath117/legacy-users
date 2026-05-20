variable "app_port" {
  description = "Puerto de la aplicación (Grupo C)"
  type        = number
  default     = 8000
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "iam_instance_profile" {
  description = "Perfil IAM para la instancia de AWS Academy"
  type        = string
  default     = "LabInstanceProfile"
}