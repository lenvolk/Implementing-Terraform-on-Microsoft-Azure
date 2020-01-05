
######################   INFO

variable tfsa {
  default = ""
}

variable tfcnt {
  default = ""
}

variable vnet_key {
    default = ""
}

variable ackey {
  default = ""
}

data "terraform_remote_state" "main_vnet_info" {
  backend = "azurerm"
  config = {
    storage_account_name = var.tfsa
    container_name       = var.tfcnt
    key                  =  "${var.vnet_key}env:${terraform.workspace}"  #"${var.vnet_key}env:Development"  #"main-vnet-01-dev.tfstateenv:Development" 
    access_key           = var.ackey
  }
}

output "rg_name" {
  value = data.terraform_remote_state.main_vnet_info.outputs.rg_name
}

output "vnet_id" {
  value = data.terraform_remote_state.main_vnet_info.outputs.vnet_id
 }

output "vnet_name" {
  value = data.terraform_remote_state.main_vnet_info.outputs.vnet_name
}

output "sub_id" {
  value = data.terraform_remote_state.main_vnet_info.outputs.sub_id
}

# output "client_id" {
#   value = data.terraform_remote_state.main_vnet_info.outputs.client_id
# }

# output "principal_id" {
#   value = data.terraform_remote_state.main_vnet_info.outputs.principal_id
# }

# output "client_secrete" {
#   value = data.terraform_remote_state.main_vnet_info.outputs.client_secrete
# }




