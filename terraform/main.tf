terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "k8s-master" {
  name     = "k8s-master"
  image    = "ubuntu-22-04-x64"
  region   = "sgp1"
  size     = "s-2vcpu-4gb"
  vpc_uuid = digitalocean_vpc.main-vpc.id
  ssh_keys = [digitalocean_ssh_key.default-key.id]
  tags     = ["k8s-master"]
}

resource "digitalocean_droplet" "k8s-node-1" {
  name     = "k8s-node-1"
  image    = "ubuntu-22-04-x64"
  region   = "sgp1"
  size     = "s-2vcpu-2gb"
  vpc_uuid = digitalocean_vpc.main-vpc.id
  tags     = ["k8s-node"]
  ssh_keys = [digitalocean_ssh_key.default-key.id]

}

resource "digitalocean_droplet" "k8s-node-2" {
  name     = "k8s-node-2"
  image    = "ubuntu-22-04-x64"
  region   = "sgp1"
  size     = "s-2vcpu-2gb"
  vpc_uuid = digitalocean_vpc.main-vpc.id
  tags     = ["k8s-node"]
  ssh_keys = [digitalocean_ssh_key.default-key.id]
}

# Create a new container registry
resource "digitalocean_container_registry" "my-application" {
  name                   = "my-application"
  subscription_tier_slug = "starter"
}

# resource "digitalocean_droplet" "k8s-node-3" {
#   name                 = "k8s-node-3"
#   image                = "ubuntu-22-04-x64"
#   region               = "sgp1"
#   size                 = "s-2vcpu-2gb"
#   vpc_uuid = digitalocean_vpc.main-vpc.id
#   tags     = ["k8s-node"]
# }
