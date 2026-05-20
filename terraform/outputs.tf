output "public_ip" {
  description = "IP publica para acceder a la aplicacion"
  value       = module.compute.public_ip
}