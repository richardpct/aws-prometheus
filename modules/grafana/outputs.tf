output "public_ip" {
  value = aws_eip.grafana.public_ip
}
