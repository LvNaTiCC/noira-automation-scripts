variable "proxmox_api_token" {
  type = string
}

variable "proxmox_api_endpoint" {
  type = string
}

variable "chr_vm_cores" {
  type    = number
  default = 8
}

variable "chr_vm_memory_mb" {
  type = number
  default = 4096
}

variable "vm_clone_vmid" {
  type = number
} 

variable "vm_clone_host" {
  type = string
} 