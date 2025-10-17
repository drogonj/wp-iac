
# --------------- Outputs ---------------

output "db_container_id" {
  description = "ID of the database container"
  value       = module.db.db_container_id
}

output "web_container_id" {
  description = "ID of the web server container"
  value       = module.web.web_container_id
}

output "web_network_name" {
  description = "Name of the database network"
  value       = module.db.web_network_name
}

output "db_volume_name" {
  description = "Name of the database data volume"
  value       = module.db.db_volume_name
}

output "web_volume_name" {
  description = "Name of the web server data volume"
  value       = module.web.web_volume_name
}

output "ansible_inventory_path" {
  description = "Path to the generated Ansible inventory file"
  value       = local_file.ansible_inventory.filename
}


# --------------- Sensitive Outputs ---------------

output "db_name" {
  description = "Database name (sensitive)"
  value       = var.db_name
  sensitive   = true
}

output "db_admin_password" {
  description = "Database admin password (sensitive)"
  value       = var.db_admin_password
  sensitive   = true
}

output "db_user_username" {
  description = "Database user username (sensitive)"
  value       = var.db_user_username
  sensitive   = true
}

output "db_user_password" {
  description = "Database user password (sensitive)"
  value       = var.db_user_password
  sensitive   = true
}

output "wordpress_admin_username" {
  description = "WordPress admin username (sensitive)"
  value       = var.wordpress_admin_username
  sensitive   = true
}

output "wordpress_admin_password" {
  description = "WordPress admin password (sensitive)"
  value       = var.wordpress_admin_password
  sensitive   = true
}

output "wordpress_user_username" {
  description = "WordPress user username (sensitive)"
  value       = var.wordpress_user_username
  sensitive   = true
}

output "wordpress_user_password" {
  description = "WordPress user password (sensitive)"
  value       = var.wordpress_user_password
  sensitive   = true
}