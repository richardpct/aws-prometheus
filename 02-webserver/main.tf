module "webserver" {
  source = "../modules/webserver"

  region                      = "eu-west-3"
  env                         = "dev"
  network_remote_state_bucket = var.bucket
  network_remote_state_key    = var.dev_network_key
  instance_type               = "t2.micro"
  image_id                    = "ami-053bbae956af8243d"  //Ubuntu 20.04 LTS
}
