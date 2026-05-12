locals {
  default_user_account = {
    username = var.default_ssh_user
    keys     = [var.default_ssh_pubkey]
  }

  k8s_cp_vms = {
    for idx in range(var.cp_vm_count) :
    format("${var.cp_vm_prefix}-%02d", idx + 1) => {
      ip = "${var.cp_vms_ip_prefix}.${idx + 1}"
      node = var.proxmox_nodes[idx % length(var.proxmox_nodes)]
    }
  }

  k8s_node_vms = {
    for idx in range(var.node_vm_count) :
    format("${var.node_vm_prefix}-%02d", idx + 1) => {
      ip = "${var.node_vms_ip_prefix}.${idx + 1}"
      node = var.proxmox_nodes[idx % length(var.proxmox_nodes)]
    }
  }

  control_plane_hosts = [
    for name, vm in local.k8s_cp_vms :
    "${name} ansible_host=${vm.ip} ansible_user=${var.default_ssh_user}"
  ]

  worker_hosts = [
    for name, vm in local.k8s_node_vms :
    "${name} ansible_host=${vm.ip} ansible_user=${var.default_ssh_user}"
  ]
}


