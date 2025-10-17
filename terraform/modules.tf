
# --------------- Modules ---------------

module "db" {
  source = "./modules/db"

  image          = var.docker_image_name
  container_name = var.db_container_name
  data_path      = var.db_container_data_path
  db_volume_name = var.docker_db_volume_name
  network_name   = var.web_network_name
  alias          = var.db_container_alias

  # env = [
  #   "MARIADB_ROOT_PASSWORD=${var.db_root_password}",
  #   "MARIADB_USER=${var.db_user_username}",
  #   "MARIADB_PASSWORD=${var.db_user_password}",
  #   "MARIADB_DATABASE=${var.db_name}"
  # ]
}

module "web" {
  source = "./modules/web"

  image           = var.docker_image_name
  container_name  = var.web_container_name
  internal_port   = var.web_container_internal_port
  external_port   = var.web_container_external_port
  data_path       = var.web_container_data_path
  web_volume_name = var.docker_web_volume_name
  network_name    = var.web_network_name
  alias           = var.web_container_alias

  # env = [
  # ]
}

module "wordpress" {
  source = "./modules/wordpress"

  image                 = var.docker_image_name
  container_name        = var.wordpress_container_name
  data_path             = var.wordpress_container_data_path
  wordpress_volume_name = var.wordpress_volume_name
  network_name          = var.web_network_name
  alias                 = var.wordpress_container_alias

  # env = [
  #   "DB_HOST=${var.db_container_name}",
  #   "DB_PORT=${var.db_container_internal_port}",
  #   "MARIADB_USER=${var.db_user_username}",
  #   "MARIADB_PASSWORD=${var.db_user_password}",
  #   "MARIADB_DATABASE=${var.db_name}",
  #   "WORDPRESS_ADMIN_USERNAME=${var.wordpress_admin_username}",
  #   "WORDPRESS_ADMIN_PASSWORD=${var.wordpress_admin_password}",
  #   "WORDPRESS_USER=${var.wordpress_user_username}",
  #   "WORDPRESS_PASSWORD=${var.wordpress_user_password}"
  # ]
}

# Register your containers here
locals {
  managed_containers = [
    module.db.container_name,
    module.web.container_name,
    module.wordpress.container_name
  ]
}
