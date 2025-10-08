
# ----------------- Variables for DB module -----------------

variable "image" {
  description = "Docker image for the DB"
  type        = string
}

variable "container_name" {
  description = "Name of the DB container"
  type        = string
}

variable "internal_port" {
  description = "Internal DB port"
  type        = number
}

variable "data_path" {
  description = "Path inside DB container to mount the data volume"
  type        = string
}

variable "db_volume_name" {
  description = "Name of the DB docker volume"
  type        = string
}

variable "network_name" {
  description = "Docker network name to attach to"
  type        = string
}

variable "alias" {
  description = "Network alias for DB"
  type        = string
}

variable "username_secret_name" {
  description = "Docker secret name for DB username"
  type        = string
  sensitive   = true
}

variable "username_secret_data" {
  description = "Data for DB username secret"
  type        = string
  sensitive   = true
}

variable "password_secret_name" {
  description = "Docker secret name for DB password"
  type        = string
  sensitive   = true
}

variable "password_secret_data" {
  description = "Data for DB password secret"
  type        = string
  sensitive   = true
}
