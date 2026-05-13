

resource "libvirt_domain" "control_plane" {
  name        = "control-plane"
  memory      = 4096
  memory_unit = "MiB"
  vcpu        = 2
  type        = "kvm"
  running     = var.running

  os = {
    type         = "hvm"
    type_arch    = "x86_64"
    type_machine = "q35"
    boot_devices = [
      {
        dev = "hd"
      }
    ]
  }

  devices = {
    disks = [
      {
        source = {
          file = {
            file = var.control_plane_image
          }
        }
        target = {
          dev = "vda"
          bus = "virtio"
        }
      }
    ]
    interfaces = [
      {
        model = {
          type = "virtio"
        }
        source = {
          network = {
            network = "default"
          }
        }
      }
    ]
  }
}