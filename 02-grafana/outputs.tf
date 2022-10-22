output "grafana_public_ip" {
  value = module.grafana.public_ip
}

output "grafana_private_ip" {
  value = module.grafana.grafana_private_ip
}
