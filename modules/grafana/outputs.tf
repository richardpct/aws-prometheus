output "public_ip" {
  value = aws_eip.grafana.public_ip
}

output "grafana_private_ip" {
  value = aws_instance.grafana.private_ip
}
