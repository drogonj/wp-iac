
# ----------------- Variables for DB module -----------------

variable "image" {
  description = "Docker image for the DB"
  type        = string
}

variable "container_name" {
  description = "Name of the DB container"
  type        = string
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

variable "env" {
  description = "Environment variables for the web container"
  type        = list(string)
  default     = []
}