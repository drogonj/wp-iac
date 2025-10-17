
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

  env = [
    "DB_USERNAME=${var.db_username}",
    "DB_PASSWORD=${var.db_password}"
  ]
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
    "DB_USER=${var.db_username}",
    "DB_PASSWORD=${var.db_password}"
  ]
}


# Register your containers here
locals {
  managed_containers = [
    module.db.container_name,
    module.web.container_name,
  ]
}
