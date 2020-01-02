#############################################################################
# OUTPUTS
#############################################################################

output "vnet_id" {
  value = module.vnet-main.vnet_id
}


output "vnet_name" {
  value = module.vnet-main.vnet_name
}

output "sub_id" {
  value = data.azurerm_subscription.current.subscription_id
}

output "rg_name" {
  value = data.azurerm_resource_group.my_rg.name
}
