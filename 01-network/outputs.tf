output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_public_id" {
  value = module.network.subnet_public_id
}

output "ssh_key" {
  value = module.network.ssh_key
}

output "grafana_sg_id" {
  value = module.network.grafana_sg_id
}

output "prometheus_sg_id" {
  value = module.network.prometheus_sg_id
}
