
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

variable "wordpress_volume_name" {
  description = "Docker volume name for WordPress data"
  type        = string
  default     = "wordpress_data"
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

variable "db_container_alias" {
  description = "Network alias for the database container"
  type        = string
  default     = "postgres"
}

variable "db_volume_mount_path" {
  description = "Path inside the container where the volume will be mounted"
  type        = string
  default     = "/var/lib/postgresql/data"
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

variable "web_container_alias" {
  description = "Network alias for the web server container"
  type        = string
  default     = "web"
}

# Use wordpress volume name

variable "web_volume_mount_path" {
  description = "Path inside the container where the volume will be mounted"
  type        = string
  default     = "/var/www/html"
}

# --------------- WordPress Container ---------------

variable "wordpress_container_name" {
  description = "Name of the WordPress container"
  type        = string
  default     = "wordpress_container"
}

variable "wordpress_container_alias" {
  description = "Network alias for the WordPress container"
  type        = string
  default     = "wordpress"
}

variable "wordpress_volume_mount_path" {
  description = "Path inside the container where the volume will be mounted"
  type        = string
  default     = "/var/www/html"
}
