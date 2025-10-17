
# ----------------- Variables for Web module -----------------

variable "image" {
  description = "Docker image for the web container"
  type        = string
}

variable "container_name" {
  description = "Name of the web container"
  type        = string
}

variable "data_path" {
  description = "Path inside the web container to mount data"
  type        = string
}

variable "wordpress_volume_name" {
  description = "Docker volume name for wordpress data"
  type        = string
}

variable "network_name" {
  description = "Docker network name to attach to"
  type        = string
}

variable "alias" {
  description = "Network alias for wordpress"
  type        = string
}

variable "env" {
  description = "Environment variables for the wordpress container"
  type        = list(string)
  default     = []
}
