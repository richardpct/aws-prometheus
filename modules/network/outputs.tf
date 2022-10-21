output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnet_public_id" {
  value = aws_subnet.public.id
}

output "ssh_key" {
  value = aws_key_pair.deployer.key_name
}

output "webserver_sg_id" {
  value = aws_security_group.webserver.id
}

output "prometheus_sg_id" {
  value = aws_security_group.prometheus.id
}
