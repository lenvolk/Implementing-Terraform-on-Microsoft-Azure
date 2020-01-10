#############################################################################
# PROVIDERS
#############################################################################

# https://www.terraform.io/docs/configuration/providers.html#selecting-alternate-providers

provider "azurerm" {
  alias           = "security"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  version         = "~> 1.39"
  skip_provider_registration  = true
  skip_credentials_validation = true
}

provider "azurerm" {
  alias                       = "peering"
  subscription_id             = data.azurerm_subscription.current.subscription_id
  # client_id                   = var.sec_client_id
  # client_secret               = var.sec_client_secret
  client_id                   = var.client_id
  client_secret               = var.client_secret
  tenant_id                   = var.tenant_id
  skip_provider_registration  = true
  skip_credentials_validation = true
}

#Set the terraform backend
terraform {
  required_version = ">= 0.12.6"
  backend "azurerm" {} #Backend variables are initialized through the secret and variable folders
}


#############################################################################
# DATA
#############################################################################

data "azurerm_subscription" "current" {
  provider = azurerm.security
}

data "azurerm_resource_group" "existing_rg" {
  provider = azurerm.peering
  name = var.existing_rg
}

data "azurerm_virtual_network" "existing_vnet" {
    provider            = azurerm.peering
    resource_group_name = var.existing_rg
    name                = var.existing_vnet
}

#############################################################################
# LIB
#############################################################################

module "lib"{

source = "./lib"

tfsa = var.tfsa

tfcnt = var.tfcnt

vnet_key_main = var.vnet_key_main

vnet_key_sec= var.vnet_key_sec

ackey = var.ackey

}
