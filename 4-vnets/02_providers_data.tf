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

# provider "azurerm" {
#   subscription_id = "25de1ca2-09a3-42e0-97cc-5fffbc53286f"  #var.mainsub_id
#   #subscription_id = data.azurerm_subscription.current.subscription_id
#   client_id       = var.client_id
#   client_secret   = var.client_secret
#   tenant_id       = var.tenant_id
#   version        = "~> 1.0" 
#   alias          = "security"
# }

#Set the terraform backend
terraform {
  required_version = ">= 0.12.6"
  backend "azurerm" {} #Backend variables are initialized through the secret and variable folders
}


#############################################################################
# DATA
#############################################################################

data "azurerm_subscription" "current" {
  #provider = azurerm.networking
}

# data "azurerm_resource_group" "my_rg" {
#   #provider = azurerm.networking
#   name = var.existing_rg
# }