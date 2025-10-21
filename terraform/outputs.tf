
# --------------- Outputs ---------------

output "db_container_id" {
  description = "ID of the database container"
  value       = module.db.db_container_id
}

output "web_container_id" {
  description = "ID of the web server container"
  value       = module.web.web_container_id
}

output "wordpress_container_id" {
  description = "ID of the WordPress container"
  value       = module.wordpress.wordpress_container_id
}

output "web_network_name" {
  description = "Name of the web network"
  value       = var.web_network_name
}

output "db_volume_name" {
  description = "Name of the database data volume"
  value       = module.db.db_volume_name
}

output "wordpress_volume_name" {
  description = "Name of the WordPress data volume"
  value       = module.wordpress.wordpress_volume_name
}

output "ansible_inventory_path" {
  description = "Path to the generated Ansible inventory file"
  value       = local_file.ansible_inventory.filename
}
