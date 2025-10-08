
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

# --------------- Docker Secrets ---------------

variable "db_username_secret_name" {
  description = "Name of the Docker secret for database username"
  type        = string
}

variable "db_username_secret_data" {
  description = "Data for the Docker secret for database username"
  type        = string
  sensitive   = true
}

variable "db_password_secret_name" {
  description = "Name of the Docker secret for database password"
  type        = string
}

variable "db_password_secret_data" {
  description = "Data for the Docker secret for database password"
  type        = string
  sensitive   = true
}

# --------------- Docker Networks ---------------

variable "db_network_name" {
  description = "Name of the Docker network for database"
  type        = string
  default     = "db_network"
}

# --------------- Database Container ---------------

variable "db_container_name" {
  description = "Name of the database container"
  type        = string
  default     = "db_container"
}

variable "db_container_internal_port" {
  description = "Internal port on which the database container will listen"
  type        = number
  default     = 5432
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
  default     = 80
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
