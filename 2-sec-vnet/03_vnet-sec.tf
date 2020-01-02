## NETWORKING ##

resource "azurerm_resource_group" "sec" {
  name     = var.sec_resource_group_name
  location = var.location

  tags = {
    environment = "security"
  }
}

module "vnet-sec" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = azurerm_resource_group.sec.name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.vnet_cidr_range
  subnet_prefixes     = var.sec_subnet_prefixes
  subnet_names        = var.sec_subnet_names
  nsg_ids             = {}

  # providers           = {
  #   azurerm           = azurerm.security 
  # }

  tags                = {
    environment       = "security"
    costcenter        = "security"

  }
}