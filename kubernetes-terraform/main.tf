terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.70.1" // allows 0.70.2, but not 0.71.0 for instance.
                            // You could omit this to always use the latest version if you wanted.
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_api_endpoint
  api_token = var.proxmox_api_token
  insecure = true
}

# Mock up signel VM deployment
resource "proxmox_virtual_environment_vm" "k8s-cp01" {
  node_name	= "pve01"
  name		= "k8s-cp01"

  clone {
    vm_id = 103
  }

  cpu {
    cores = 4
  }

  memory {
    dedicated = 4096
  }

  initialization {
    datastore_id = "linstor-infra-2x"
    ip_config {
      ipv4 {
        address = "172.16.10.1/16"
        gateway = "172.16.0.1"
      }
    }
    dns {
        servers = ["1.1.1.1"]
    }
    user_account {
      username = local.default_user_account.username
      keys = local.default_user_account.keys
    }

  }

  disk {
    interface = "scsi0"
    datastore_id = "linstor-infra-2x"
    size = 50
  }

  network_device {
    bridge = "vxvnet10"
  }
}
