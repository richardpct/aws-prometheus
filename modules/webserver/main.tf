provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami                    = var.image_id
  user_data              = templatefile("${path.module}/user-data.sh", { environment = var.env })
  instance_type          = var.instance_type
  key_name               = data.terraform_remote_state.network.outputs.ssh_key
  subnet_id              = data.terraform_remote_state.network.outputs.subnet_public_id
  vpc_security_group_ids = [data.terraform_remote_state.network.outputs.webserver_sg_id]

  tags = {
    Name = "web_server-${var.env}"
  }
}

resource "aws_eip" "web" {
  instance = aws_instance.web.id
  vpc      = true

  tags = {
    Name = "eip_web-${var.env}"
  }
}
