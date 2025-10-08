
# ----------------- Outputs for DB module -----------------

output "db_container_id" {
  value       = docker_container.db.id
  description = "ID of the database container"
}

output "db_volume_name" {
  value       = docker_volume.data.name
  description = "Name of the database volume"
}

output "db_network_name" {
  value       = var.network_name
  description = "Network name attached to DB"
}
