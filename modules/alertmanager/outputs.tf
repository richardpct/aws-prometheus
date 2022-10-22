output "public_ip" {
  value = aws_eip.alertmanager.public_ip
}

output "alertmanager_private_ip" {
  value = aws_instance.alertmanager.private_ip
}
