output "prometheus_public_ip" {
  value = aws_eip.prometheus.public_ip
}
