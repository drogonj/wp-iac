
# ----------------- Variables for Web module -----------------

variable "image" {
  description = "Docker image for the web container"
  type        = string
}

variable "container_name" {
  description = "Name of the web container"
  type        = string
}

variable "internal_port" {
  description = "Internal port on which the web server listens"
  type        = number
}

variable "external_port" {
  description = "External port mapped to the web server"
  type        = number
}

variable "data_path" {
  description = "Path inside the web container to mount data"
  type        = string
}

variable "web_volume_name" {
  description = "Docker volume name for web data"
  type        = string
}

variable "network_name" {
  description = "Docker network name to attach to"
  type        = string
}

variable "alias" {
  description = "Network alias for web"
  type        = string
}

variable "env" {
  description = "Environment variables for the web container"
  type        = list(string)
  default     = []
}
