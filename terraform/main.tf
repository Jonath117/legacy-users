# Bloque Data para obtener dinámicamente la última AMI de Amazon Linux 2023
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

module "network" {
  source   = "./modules/network"
  app_port = var.app_port
}

module "compute" {
  source               = "./modules/compute"
  ami_id               = data.aws_ami.amazon_linux_2023.id
  instance_type        = var.instance_type
  sg_id                = module.network.sg_id
  iam_instance_profile = var.iam_instance_profile
}