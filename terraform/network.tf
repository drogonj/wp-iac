
# --------------- Docker network ---------------

resource "docker_network" "db_net" {
  name       = var.db_network_name
  driver     = "bridge"
  attachable = true

}