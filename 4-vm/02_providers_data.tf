
#############################################################################
# PROVIDERS
#############################################################################

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  version        = "~> 1.0" 
  #alias          = "networking"
}


#############################################################################
# DATA
#############################################################################

data "azurerm_subscription" "current" {
  #provider = azurerm.networking
}

data "azurerm_resource_group" "my_rg" {
  #provider = azurerm.networking
  name = var.rg_infr_name
}