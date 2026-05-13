
resource "libvirt_domain" "control_plane" {
  name        = "control-plane"
  memory      = 4096
  memory_unit = "MiB"
  vcpu        = 2
  type        = "kvm"
  running     = var.running

  cpu = {
    mode = "host-passthrough"
  }

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
    serials = [{
      #source = {
      #  pty = {
      #    path = none
      #  }
      #}
      target = {
        port = 0
        type = "isa-serial"
      }
    }]
    consoles = [{
      #source = {
      #  pty = {
      #    path = "/dev/pts/4"
      #  }
      #}
      target = {
        port = 0
        type = "serial"
      }
    }]
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
            network = libvirt_network.chroma_network.name
          }
        }
      }
    ]
  }

}
