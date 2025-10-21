
# --------------- Docker network ---------------

resource "docker_network" "web_network" {
  name       = var.web_network_name
  driver     = "bridge"
  attachable = true
}