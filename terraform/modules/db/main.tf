
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

resource "docker_secret" "username" {
  name = var.username_secret_name
  # provider expects base64-encoded data
  data = base64encode(var.username_secret_data)
}

resource "docker_secret" "password" {
  name = var.password_secret_name
  data = base64encode(var.password_secret_data)
}

resource "docker_container" "db" {
  image = var.image
  name  = var.container_name

  ports {
    internal = var.internal_port
  }

  volumes {
    volume_name    = docker_volume.data.name
    container_path = var.data_path
  }

  networks_advanced {
    name    = var.network_name
    aliases = [var.alias]
  }
}
