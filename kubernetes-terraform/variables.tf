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

variable "vm_memory_mb" {
  type    = number
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
