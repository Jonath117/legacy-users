resource "aws_instance" "app_server" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  iam_instance_profile = var.iam_instance_profile

  user_data = <<-EOF
              #!/bin/bash
              # Actualizar paquetes con yum (Especifico para Amazon Linux 2023)
              yum update -y
              
              # Instalar Node.js 20
              curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -
              yum install -y nodejs
              
              # Instalar Git
              yum install -y git
              
              # Crear directorio, clonar app e instalar dependencias
              cd /home/ec2-user
              git clone https://github.com/Brizio23/legacy-users.git app
              cd app
              npm install
              
              # Instalar PM2 globalmente para mantener viva la app en background
              npm install -g pm2
              pm2 start app.js --name "legacy-users"
              
              # Configurar PM2 para arrancar junto con el sistema
              pm2 startup
              pm2 save
              EOF

  tags = {
    Name = "LegacyUsers-Server"
  }
}