data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = var.network_remote_state_bucket
    key    = var.network_remote_state_key
    region = var.region
  }
}

data "terraform_remote_state" "grafana" {
  backend = "s3"

  config = {
    bucket = var.grafana_remote_state_bucket
    key    = var.grafana_remote_state_key
    region = var.region
  }
}

data "terraform_remote_state" "alertmanager" {
  backend = "s3"

  config = {
    bucket = var.alertmanager_remote_state_bucket
    key    = var.alertmanager_remote_state_key
    region = var.region
  }
}
