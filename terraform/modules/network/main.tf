resource "aws_security_group" "app_sg" {
  name        = "legacy-users-sg"
  description = "Permitir trafico entrante al puerto de la app"

  ingress {
    description = "Trafico web de la aplicacion"
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "tcp"
    cidr_blocks = ["190.104.20.154/32"] 
  }

  ingress {
    description = "Trafico SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["190.104.20.154/32"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}