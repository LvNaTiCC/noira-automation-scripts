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

resource "proxmox_virtual_environment_vm" "k8s-cp" {
  for each = local.k8s_cp_vms

  node_name = each.value.node
  name = each.keys

  clone {
    vm_id = var.vm_clone_vmid
  }

  cpu {
    cores = var.cp_vm_cores
  }

  memory {
    dedicated = var.cp_vm_memory_mb
  }

  initialization {
    datastore_id = var.vm_disks_datastore_id

    ip_config {
      ipv4 {
        address = "${each.value.ip}/{${var.network_mask}}"
      }
    }

    dns {
      servers = var.vm_dns_servers
    }

    user_account = {
      username = local.default_user_account.username
      keys = local.default_user_account.keys
    }
  }

  disk {
    interface = "scsi0"
    datastore_id = var.vm_disks_datastore_id
    size = var.cp_vm_disk_size_gb
  }

  network_device {
    bridge = var.vm_if_bridge
  }
}
