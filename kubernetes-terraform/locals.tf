locals {
  default_user_account = {
    username = var.default_ssh_user
    keys     = [var.default_ssh_pubkey]
  }
}
