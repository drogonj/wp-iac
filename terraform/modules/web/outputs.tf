# ----------------- Outputs for Web module -----------------

output "web_container_id" {
  value       = docker_container.web.id
  description = "ID of the web container"
}

output "web_volume_name" {
  value       = docker_volume.web_data.name
  description = "Name of the web data volume"
}

output "web_network_name" {
  description = "Name of the Docker network for web"
  value       = var.network_name
}

output "container_name" {
  description = "Name of the created web container"
  value       = docker_container.web.name
}
