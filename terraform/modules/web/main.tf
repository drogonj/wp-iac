
# ----------------- Terraform configuration for Web module -----------------

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6.2"
    }
  }
}

# ----------------- Resources for Web module -----------------

resource "docker_volume" "web_data" {
  name = var.web_volume_name
}

resource "docker_container" "web" {
  image = var.image
  name  = var.container_name

  env = var.env

  ports {
    internal = var.internal_port
    external = var.external_port
  }

  volumes {
    volume_name    = docker_volume.web_data.name
    container_path = var.data_path
  }

  networks_advanced {
    name    = var.network_name
    aliases = [var.alias]
  }

  command = ["sleep", "infinity"]
}
