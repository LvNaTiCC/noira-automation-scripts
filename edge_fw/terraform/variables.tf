variable "proxmox_api_token" {
  type = string
}

variable "proxmox_api_endpoint" {
  type = string
}

variable "vm_cores" {
  type    = number
  default = 2
}

variable "vm_disk_size_gb" {
  type    = number
  default = 10
}

variable "vm_memory_mb" {
  type = number
  default = 2048
}

variable "default_ssh_pubkey" {
  type      = string
  sensitive = true
}

variable "default_ssh_user" {
  type      = string
  sensitive = true
}

variable "disks_datastore_id" {
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

variable "network_mask" {
  type = string
  default = "/16"
}

variable "vm_dns_servers" {
  type = list
}

variable "edge_vms_ip_prefix" {
  type = string
}
