# ----------------- Terraform configuration for DB module -----------------

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6.2"
    }
  }
}

# ----------------- Resources for DB module -----------------

resource "docker_volume" "data" {
  name = var.db_volume_name
}

resource "docker_container" "db" {
  image = var.image
  name  = var.container_name

  env = var.env

  volumes {
    volume_name    = docker_volume.data.name
    container_path = var.data_path
  }

  networks_advanced {
    name    = var.web_network_name
    aliases = [var.alias]
  }

  command = ["sleep", "infinity"]
}
