resource "libvirt_network" "chroma_network" {
  name = "chroma_network"
  domain = {
    name       = "chroma.local"
    local_only = "no"
  }

  ips = [{
    address = "10.10.0.1"
    netmask = "255.255.255.0"
    dhcp = {
      ranges = [{
        start = "10.10.0.30",
        end   = "10.10.0.150"
      }]
    }
    family = "ipv4"
  }]
  autostart = true
}
