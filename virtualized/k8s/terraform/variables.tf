variable "proxmox_api_token" {
  type = string
}

variable "proxmox_api_endpoint" {
  type = string
}

variable "node_vm_cores" {
  type    = number
  default = 8
}

variable "node_vm_disk_size_gb" {
  type    = number
  default = 300
}

variable "cp_vm_cores" {
  type = number
  default = 4
}

variable "cp_vm_disk_size_gb" {
  type = number
  default = 50
}

variable "cp_vm_memory_mb" {
  type = number
  default = 4096
}

variable "node_vm_memory_mb" {
  type = number
  default = 16384
}

variable "default_ssh_pubkey" {
  type      = string
  sensitive = true
}

variable "default_ssh_user" {
  type      = string
  sensitive = true
}

variable "vm_disks_datastore_id" {
  type = string
}

variable "vm_network_gateway" {
  type = string
}

variable "vm_if_bridge" {
  type = string
}

variable "proxmox_nodes" {
  type = list
}

variable "vm_clone_vmid" {
  type = number
} 

variable "vm_clone_host" {
  type = string
} 

variable "cp_vm_prefix" {
  type = string
  default = "k8s-cp"
}

variable "node_vm_prefix" {
  type = string
  default = "k8s-node"
}

variable "cp_vm_count" {
  type = number
  default = 3
}

variable "node_vm_count" {
  type = number
  default = 3
}

variable "network_mask" {
  type = string
  default = "/16"
}

variable "node_vms_ip_prefix" {
  type = string
  default = "172.16.90."
}

variable "cp_vms_ip_prefix" {
  type = string
}

variable "vm_dns_servers" {
  type = list
}
