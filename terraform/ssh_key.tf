resource "digitalocean_ssh_key" "default-key"{
    name = "default-key"
    public_key = file("./.ssh/do_key.pub")
}