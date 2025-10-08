
# --------------- Outputs ---------------

output "db_container_id" {
  description = "ID of the database container"
  value       = module.db.db_container_id
}

output "web_container_id" {
  description = "ID of the web server container"
  value       = module.web.web_container_id
}

output "db_network_name" {
  description = "Name of the database network"
  value       = module.db.db_network_name
}

output "db_volume_name" {
  description = "Name of the database data volume"
  value       = module.db.db_volume_name
}

output "web_volume_name" {
  description = "Name of the web server data volume"
  value       = module.web.web_volume_name
}
