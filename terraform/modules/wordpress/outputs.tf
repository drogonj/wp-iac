# ----------------- Outputs for Web module -----------------

output "wordpress_container_id" {
  value       = docker_container.wordpress.id
  description = "ID of the wordpress container"
}

output "wordpress_volume_name" {
  value       = docker_volume.wordpress_data.name
  description = "Name of the wordpress data volume"
}

output "container_name" {
  description = "Name of the created wordpress container"
  value       = docker_container.wordpress.name
}
