
# --------------- Docker Images ---------------

variable "docker_image_name" {
  description = "Name of the Docker image to use for containers"
  type        = string
  default     = "debian:bullseye-slim"
}

# --------------- Docker Volumes ---------------

variable "docker_db_volume_name" {
  description = "Name of the Docker volume for database data"
  type        = string
  default     = "db_data_volume"
}

variable "docker_web_volume_name" {
  description = "Name of the Docker volume for web server data"
  type        = string
  default     = "web_data_volume"
}

# --------------- Docker Networks ---------------

variable "web_network_name" {
  description = "Name of the Docker network for the project"
  type        = string
  default     = "web_network"
}

# --------------- Database Container ---------------

variable "db_container_name" {
  description = "Name of the database container"
  type        = string
  default     = "db_container"
}

variable "db_port" {
  description = "Internal port on which the database container will listen"
  type        = number
  default     = 3306
}

variable "db_container_data_path" {
  description = "Path inside the database container to mount the data volume"
  type        = string
  default     = "/var/lib/postgresql/data"
}

variable "db_container_alias" {
  description = "Network alias for the database container"
  type        = string
  default     = "postgres"
}

# --------------- Web Server Container ---------------

variable "web_container_name" {
  description = "Name of the web server container"
  type        = string
  default     = "web_container"
}

variable "web_container_internal_port" {
  description = "Internal port on which the web server container will listen"
  type        = number
  default     = 80
}

variable "web_container_external_port" {
  description = "External port to map to the web server container"
  type        = number
  default     = 8080
}

variable "web_container_data_path" {
  description = "Path inside the web server container to mount the data volume"
  type        = string
  default     = "/usr/share/nginx/html"
}

variable "web_container_alias" {
  description = "Network alias for the web server container"
  type        = string
  default     = "web"
}

# --------------- WordPress Container ---------------

variable "wordpress_container_name" {
  description = "Name of the WordPress container"
  type        = string
  default     = "wordpress_container"
}

variable "wordpress_container_data_path" {
  description = "Path inside the WordPress container to mount the data volume"
  type        = string
  default     = "/var/www/html"
}

variable "wordpress_container_alias" {
  description = "Network alias for the WordPress container"
  type        = string
  default     = "wordpress"
}

variable "wordpress_internal_port" {
  description = "Port on which the WordPress container will listen"
  type        = number
  default     = 8080
}

variable "wordpress_volume_name" {
  description = "Docker volume name for WordPress data"
  type        = string
  default     = "wordpress_data"
}

# --------------- Secrets ---------------

variable "db_name" {
  description = "Name of the database (sensitive)"
  type        = string
  sensitive   = true
}

variable "db_admin_password" {
  description = "Admin password for the database (sensitive)"
  type        = string
  sensitive   = true
}

variable "db_user_username" {
  description = "Username for the database user (sensitive)"
  type        = string
  sensitive   = true
}

variable "db_user_password" {
  description = "Password for the database user (sensitive)"
  type        = string
  sensitive   = true
}

variable "wp_admin_username" {
  description = "Admin username for WordPress (sensitive)"
  type        = string
  sensitive   = true
}

variable "wp_admin_password" {
  description = "Admin password for WordPress (sensitive)"
  type        = string
  sensitive   = true
}

variable "wp_user_username" {
  description = "Username for the WordPress user (sensitive)"
  type        = string
  sensitive   = true
}

variable "wp_user_password" {
  description = "Password for the WordPress user (sensitive)"
  type        = string
  sensitive   = true
}
