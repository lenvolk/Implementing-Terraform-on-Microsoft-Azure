
#############################################################################
# PROVIDERS
#############################################################################

provider "azurerm" {
  # alias           = "security"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  version         = "~> 1.39"
  skip_provider_registration  = true
  skip_credentials_validation = true
}


provider "azuread" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  version         = "~> 0.7" 
}

#Set the terraform backend
terraform {
  required_version = ">= 0.12.6"
  backend "azurerm" {} #Backend variables are initialized through the secret and variable folders
}


#############################################################################
# DATA
#############################################################################

data "azurerm_subscription" "current" {}

