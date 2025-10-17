
# --------------- Docker network ---------------

resource "docker_network" "web_net" {
  name       = var.web_network_name
  driver     = "bridge"
  attachable = true
}