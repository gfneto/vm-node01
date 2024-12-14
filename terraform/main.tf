resource "libvirt_pool" "vms" {
  name = "ubuntu"
  type = "dir"
  path = var.libvirt_disk_path
}

# Define the disk for the VM
resource "libvirt_volume" "ubuntu_disk" {
  name   = "ubuntu-vm-disk.qcow2"
  pool   = "default"  # Assuming the default pool is available
  format = "qcow2"
  size   = 20 * 1024 * 1024 * 1024  # 20 GB disk
}

# Define the virtual machine
resource "libvirt_domain" "ubuntu_vm" {
  name   = "ubuntu-vm"
  memory = "2048"  # 2 GB of memory
  vcpu   = 2       # 2 virtual CPUs

  disk {
    volume_id = libvirt_volume.ubuntu_disk.id
  }

  network_interface {
    network_name = "default"  # Assuming default network is available
    macvtap      = false
  }

  graphics {
    type = "spice"
  }

  # Use the Ubuntu ISO image for installation
  cdrom {
    path = "/data/images/ubuntu-24.04.1-live-server-amd64.iso"
  }

}

