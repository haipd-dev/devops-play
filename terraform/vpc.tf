resource "digitalocean_vpc" "main-vpc" {
  name     = "main-vpc"
  region   = "sgp1"
  ip_range = "192.168.1.0/24"
}

variable "master_ip" {
  description = "The id of the master node"
  type        = string
  default     = "192.168.1.2"
}
