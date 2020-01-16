######################   INFO

variable tfsa {
  default = ""
}

variable tfcnt {
  default = ""
}

variable vnet_key_main {
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
    key                  = "${var.vnet_key_main}env:${terraform.workspace}" 
    access_key           = var.ackey
  }
}

#### picking up data from main vnet
output "rg_name_main" {
  value = data.terraform_remote_state.main_vnet_info.outputs.rg_name
}

output "vnet_id_main" {
  value = data.terraform_remote_state.main_vnet_info.outputs.vnet_id
 }

output "vnet_name_main" {
  value = data.terraform_remote_state.main_vnet_info.outputs.vnet_name
}

output "sub_id_main" {
  value = data.terraform_remote_state.main_vnet_info.outputs.sub_id
}