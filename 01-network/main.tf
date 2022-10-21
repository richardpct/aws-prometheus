module "network" {
  source = "../modules/network"

  region           = "eu-west-3"
  env              = "dev"
  vpc_cidr_block   = "10.0.0.0/16"
  subnet_public    = "10.0.0.0/24"
  ssh_public_key   = var.ssh_public_key
  cidr_allowed_ssh = var.my_ip_address
}
