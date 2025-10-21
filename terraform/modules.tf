
# --------------- Modules ---------------

module "db" {
  source = "./modules/db"

  image               = var.docker_image_name
  container_name      = var.db_container_name
  volume_mount_path   = var.db_volume_mount_path
  db_volume_name      = var.docker_db_volume_name
  network_name        = var.web_network_name
  alias               = var.db_container_alias
}

module "wordpress" {
  source = "./modules/wordpress"

  image                 = var.docker_image_name
  container_name        = var.wordpress_container_name
  volume_mount_path     = var.wordpress_volume_mount_path
  wordpress_volume_name = var.wordpress_volume_name
  network_name          = var.web_network_name
  alias                 = var.wordpress_container_alias
}

module "web" {
  source = "./modules/web"

  image               = var.docker_image_name
  container_name      = var.web_container_name
  internal_port       = var.web_container_internal_port
  external_port       = var.web_container_external_port
  volume_mount_path   = var.web_volume_mount_path
  web_volume_name     = var.wordpress_volume_name
  network_name        = var.web_network_name
  alias               = var.web_container_alias
}

# Register your containers here
locals {
  managed_containers = [
    module.db.container_name,
    module.wordpress.container_name,
    module.web.container_name,
  ]
}
