#############################################################################
# OUTPUTS
#############################################################################

output "vnet_id" {
  value = module.vnet-sec.vnet_id
}

output "vnet_name" {
  value = module.vnet-sec.vnet_name
}

output "sub_id" {
  value = data.azurerm_subscription.current.subscription_id
}

output "client_id" {
  value = azuread_service_principal.vnet_peering.application_id
}

output "principal_id" {
  value = azuread_service_principal.vnet_peering.id
}

output "client_secrete" {
  value = random_password.vnet_peering.result
}

output "resource_group" {
  value = azurerm_resource_group.sec.name
}

