locals {
  default_user_account = {
    username = var.default_ssh_user
    keys     = [var.default_ssh_pubkey]
  }

  edge_vms = {
    for idx in range(length(var.proxmox_nodes)) :
    format("$edge-fw-%02d", idx + 1) => {
      ip = "${var.edge_vms_ip_prefix}.${idx + 1}"
      node = var.proxmox_nodes[idx % length(var.proxmox_nodes)]
    }
  }

  edge_hosts = [
    for name, vm in local.edge_vms :
    "${name} ansible_host=${vm.ip} ansible_user=${var.default_ssh_user}"
  ]
}