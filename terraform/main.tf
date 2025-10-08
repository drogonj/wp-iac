
# --------------- Providers configuration ---------------

terraform {
  required_version = ">= 1.12.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6.2"
    }
  }
}

provider "docker" {}

# --------------- Docker image ---------------

resource "docker_image" "project_image" {
  name = var.docker_image_name
}

# --------------- Modules ---------------

module "db" {
  source = "./modules/db"

  image          = var.docker_image_name
  container_name = var.db_container_name
  internal_port  = var.db_container_internal_port
  data_path      = var.db_container_data_path
  db_volume_name = var.docker_db_volume_name
  network_name   = var.db_network_name
  alias          = var.db_container_alias

  username_secret_name = var.db_username_secret_name
  username_secret_data = var.db_username_secret_data
  password_secret_name = var.db_password_secret_name
  password_secret_data = var.db_password_secret_data
}

module "web" {
  source = "./modules/web"

  image           = var.docker_image_name
  container_name  = var.web_container_name
  internal_port   = var.web_container_internal_port
  external_port   = var.web_container_external_port
  data_path       = var.web_container_data_path
  web_volume_name = var.docker_web_volume_name
  network_name    = var.db_network_name
  alias           = var.web_container_alias

  env = [
    "DB_HOST=${var.db_container_name}",
    "DB_PORT=${var.db_container_internal_port}",
    "DB_USER=${var.db_username_secret_data}",
    "DB_PASSWORD=${var.db_password_secret_data}"
  ]
}
