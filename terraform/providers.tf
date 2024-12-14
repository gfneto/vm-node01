terraform {
  required_version = ">= 0.15"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.9"
    }
  }
}

provider "libvirt" {
  uri = "qemu+ssh://ursula@vm-node01/system?keyfile=/home/geraldo/.ssh/id_ed25519"
}

