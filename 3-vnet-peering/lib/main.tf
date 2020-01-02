
######################   INFO




variable tfsa {
  default = "psinfrasdbx10000mysa"
}

variable tfcnt {
  default = "tfstate"
}

variable vnet_key {
    default = "main-vnet-01-dev.tfstate"
}

variable ackey {
  default = "gVDrTziH13hj7vT8+/wmHUe/XeSgG38CagoobbmZ9VrAIM5i8bwKsE6bshTVLpMZpNQXzXaijnqzbh23HUANzg=="
}

data "terraform_remote_state" "vnet_info" {
  backend = "azurerm"
  config = {
    storage_account_name = var.tfsa
    container_name       = var.tfcnt
    key                  = "${var.vnet_key}env:${terraform.workspace}"
    access_key           = var.ackey
  }
}

output "rg_name" {
  value = data.terraform_remote_state.vnet_info.outputs.rg_name
}

output "vnet_id" {
  value = data.terraform_remote_state.vnet_info.outputs.vnet_id
 }

output "vnet_name" {
  value = data.terraform_remote_state.vnet_info.outputs.vnet_name
}

output "sub_id" {
  value = data.terraform_remote_state.vnet_info.outputs.sub_id
}

# output "client_id" {
#   value = data.terraform_remote_state.vnet_info.outputs.client_id
# }

# output "principal_id" {
#   value = data.terraform_remote_state.vnet_info.outputs.principal_id
# }

# output "client_secrete" {
#   value = data.terraform_remote_state.vnet_info.outputs.client_secrete
# }




