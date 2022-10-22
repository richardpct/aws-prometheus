provider "aws" {
  region = var.region
}

resource "aws_instance" "prometheus" {
  ami                    = var.image_id
  user_data              = templatefile("${path.module}/user-data.sh", { grafana_private_ip = data.terraform_remote_state.grafana.outputs.grafana_private_ip,
                                                                         alertmanager_private_ip = data.terraform_remote_state.alertmanager.outputs.alertmanager_private_ip })
  instance_type          = var.instance_type
  key_name               = data.terraform_remote_state.network.outputs.ssh_key
  subnet_id              = data.terraform_remote_state.network.outputs.subnet_public_id
  vpc_security_group_ids = [data.terraform_remote_state.network.outputs.prometheus_sg_id]

  tags = {
    Name = "prometheus-${var.env}"
  }
}

resource "aws_eip" "prometheus" {
  instance = aws_instance.prometheus.id
  vpc      = true

  tags = {
    Name = "eip_prometheus-${var.env}"
  }
}
