output "alertmanager_public_ip" {
  value = module.alertmanager.public_ip
}

output "alertmanager_private_ip" {
  value = module.alertmanager.alertmanager_private_ip
}
