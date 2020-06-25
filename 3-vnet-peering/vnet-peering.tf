variable "sec_sub_id" {
  type = string
}

variable "sec_client_id" {
  type = string
}

variable "sec_client_secret" {
  type = string
}

variable "sec_vnet_name" {
  type = string
}

variable "sec_vnet_id" {
  type = string
}

variable "sec_resource_group" {
  type = string
}

variable "sec_principal_id" {
  type = string
}


data "azurerm_subscription" "current" {}


provider "azurerm" {
  alias           = "security"
  subscription_id = var.sec_sub_id
  client_id       = var.sec_client_id
  client_secret   = var.sec_client_secret
  skip_provider_registration  = true
  skip_credentials_validation = true
}

provider "azurerm" {
  alias                       = "peering"
  subscription_id             = data.azurerm_subscription.current.subscription_id
  client_id                   = var.sec_client_id
  client_secret               = var.sec_client_secret
  skip_provider_registration  = true
  skip_credentials_validation = true
}

resource "azurerm_role_definition" "vnet-peering" {
  name  = "allow-vnet-peer-main"
  scope = data.azurerm_subscription.current.id

  permissions {
    actions     = ["Microsoft.Network/virtualNetworks/virtualNetworkPeerings/write", "Microsoft.Network/virtualNetworks/peer/action", "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/read", "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/delete"]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.current.id,
  ]
}

# #################################
# # Admin
# # https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#azure-kubernetes-service-cluster-admin-role
# #################################
# resource "azurerm_role_assignment" "aks_cluster_admin" {
#   for_each =  toset(var.aks_cluster_admin)
#   scope                = azurerm_kubernetes_cluster.main.id
#   role_definition_name = "Azure Kubernetes Service Cluster Admin Role"
#   principal_id         = each.value
# }


# #################################
# # User
# # https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#azure-kubernetes-service-cluster-user-role
# ############################
# resource "azurerm_role_assignment" "aks_cluster_user" {
#   for_each =  toset(var.aks_cluster_user)
#   scope                = azurerm_kubernetes_cluster.main.id
#   role_definition_name = "Azure Kubernetes Service Cluster User Role"
#   principal_id         = each.value
# }

resource "azurerm_role_assignment" "vnet" {
  scope              = module.vnet-main.vnet_id
  role_definition_id = azurerm_role_definition.vnet-peering.id
  principal_id       = var.sec_principal_id
}

resource "azurerm_virtual_network_peering" "main" {
  name                      = "main_2_sec"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = module.vnet-main.vnet_name
  remote_virtual_network_id = var.sec_vnet_id
  provider                  = azurerm.peering

  depends_on = [azurerm_role_assignment.vnet]
}

resource "azurerm_virtual_network_peering" "sec" {
  name                      = "sec_2_main"
  resource_group_name       = var.sec_resource_group
  virtual_network_name      = var.sec_vnet_name
  remote_virtual_network_id = module.vnet-main.vnet_id
  provider                  = azurerm.security

  depends_on = [azurerm_role_assignment.vnet]
}