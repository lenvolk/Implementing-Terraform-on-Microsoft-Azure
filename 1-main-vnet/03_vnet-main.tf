
#############################################################################
# RESOURCES
#############################################################################

module "vnet-main" {
  source              = "Azure/vnet/azurerm"    # https://registry.terraform.io/modules/Azure/vnet/azurerm/1.2.0
  resource_group_name = data.azurerm_resource_group.my_rg.name
  location            = data.azurerm_resource_group.my_rg.location
  vnet_name           = var.vnet_name
  address_space       = module.us411.vnet_cidr_range
  subnet_prefixes     = [ cidrsubnet(module.us411.vnet_cidr_range, 8, 0), cidrsubnet(module.us411.vnet_cidr_range, 8, 1) ]
  subnet_names        = var.subnet_names
  nsg_ids             = {}  # we don't have any NSG IDs to provide

   providers          = {
   azurerm            = azurerm.networking
  }
 
  tags = {
    environment = terraform.workspace
    costcenter  = "it"

  }
}