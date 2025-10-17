
# --------------- Providers configuration ---------------

terraform {
  required_version = ">= 1.12.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6.2"
    }

    ansible = {
      source  = "ansible/ansible"
      version = "~> 1.3.0"
    }
  }
}

provider "docker" {}

provider "ansible" {}

# --------------- Docker image ---------------

resource "docker_image" "project_image" {
  name         = var.docker_image_name
  keep_locally = true
}
