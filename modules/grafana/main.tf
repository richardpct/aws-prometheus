provider "aws" {
  region = var.region
}

resource "aws_instance" "grafana" {
  ami                    = var.image_id
  user_data              = templatefile("${path.module}/user-data.sh", { environment = var.env })
  instance_type          = var.instance_type
  key_name               = data.terraform_remote_state.network.outputs.ssh_key
  subnet_id              = data.terraform_remote_state.network.outputs.subnet_public_id
  vpc_security_group_ids = [data.terraform_remote_state.network.outputs.grafana_sg_id]

  tags = {
    Name = "grafana-${var.env}"
  }
}

resource "aws_eip" "grafana" {
  instance = aws_instance.grafana.id
  vpc      = true

  tags = {
    Name = "eip_grafana-${var.env}"
  }
}
