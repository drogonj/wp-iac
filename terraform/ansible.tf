
# ----------------- Ansible Main configuration -----------------

resource "ansible_group" "containers" {
  name = "containers"
}

resource "ansible_host" "db_host" {
  name   = var.db_container_name
  groups = [ansible_group.containers.name]
  variables = {
    ansible_connection         = "community.docker.docker"
    ansible_python_interpreter = "/usr/bin/python3"
  }
}

resource "ansible_host" "web_host" {
  name   = var.web_container_name
  groups = [ansible_group.containers.name]
  variables = {
    ansible_connection         = "community.docker.docker"
    ansible_python_interpreter = "/usr/bin/python3"
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventories/terraform.ini"
  content  = <<EOT
[db]
${var.db_container_name} ansible_connection=community.docker.docker ansible_python_interpreter=/usr/bin/python3

[web]
${var.web_container_name} ansible_connection=community.docker.docker ansible_python_interpreter=/usr/bin/python3

[containers:children]
db
web
EOT
}

# Generate Ansible variables from Terraform
resource "local_file" "ansible_group_vars" {
  filename = "${path.module}/../ansible/group_vars/all.yml"
  content  = <<EOT
---
# Database configuration
db_username: "${var.db_username}"
db_password: "${var.db_password}"
db_host: "${var.db_container_name}"
db_port: ${var.db_container_internal_port}
db_name: "myapp"

# Web configuration
web_host: "${var.web_container_name}"
web_port: ${var.web_container_external_port}

# Container names (for reference)
containers:
  db: "${var.db_container_name}"
  web: "${var.web_container_name}"
EOT
}

# Install python3 on all managed containers
resource "null_resource" "install_python" {
  for_each = toset(local.managed_containers)

  provisioner "local-exec" {
    command = <<-EOT
        docker exec ${each.value} bash -c "
        apt-get update && 
        apt-get install -y python3 python3-pip curl &&
        pip3 install ansible-core
        " || echo "Failed to install on ${each.value}"
    EOT
  }
}