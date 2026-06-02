variable "chr-download-link" {
  type = string
  default = "https://download.mikrotik.com/routeros/7.21.4/chr-7.21.4.img.zip"
}

variable "debian-cloud-download-link" {
  type = string
  default = "https://cloud.debian.org/images/cloud/trixie/latest/debian-13-generic-arm64.qcow2"
}

variable "chr-default-ip" {
  type = string
  default = "192.168.88.1"
}

variable "chr-default-user" {
  type = string
  default = "admin"
}