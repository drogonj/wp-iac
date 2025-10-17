
# ----------------- Terraform configuration for Wordpress module -----------------

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6.2"
    }
  }
}

# ----------------- Resources for Wordpress module -----------------

resource "docker_volume" "wordpress_data" {
  name = var.wordpress_volume_name
}

resource "docker_container" "wordpress" {
  image = var.image
  name  = var.container_name

  env = var.env

  volumes {
    volume_name    = docker_volume.wordpress_data.name
    container_path = var.data_path
  }

  networks_advanced {
    name    = var.network_name
    aliases = [var.alias]
  }

  command = ["sleep", "infinity"]
}
