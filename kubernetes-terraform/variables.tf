variable "proxmox_api_token" {
  type = string
}

variable "proxmox_api_endpoint" {
  type = string
}

variable "worker_vm_cores" {
  type    = number
  default = 8
}

variable "worker_vm_memory_mb" {
  type    = number
  default = 16384
}

variable "cp_vm_cores {
  type = number
  default = 4
}

variable "cp_vm_memory_mb" {
  type = number
  default = 4096
}

variable "default_ssh_pubkey" {
  type      = string
  sensitive = true
}

variable "default_ssh_user" {
  type      = string
  sensitive = true
}

variable "vm-disks-datastore-id" {
  type = string
}

variable "network-gateway" {
  type = string
}

variable "proxmox-nodes" {
  type = tuple
}

variable "proxmox-nodes-push-test" {
  type = tuple
}