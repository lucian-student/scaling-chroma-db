
resource "libvirt_pool" "chroma_pool" {
  name = "chroma_pool"
  type = "dir"
  target = {
    path = "/var/lib/libvirt/images/chroma"
  }
}