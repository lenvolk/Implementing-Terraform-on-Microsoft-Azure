

#Set resource variables







#Call native Terraform resources

# data "azurerm_resource_group" "rg" {
#   name = "infr-jdld-noprd-rg1"
# }

# resource "azurerm_virtual_network" "Demo" {
#   name                = "myproductvm-perimeter-npd-vnet1"
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = data.azurerm_resource_group.rg.name
#   address_space       = ["10.0.128.0/24", "198.18.2.0/24"]
#   tags                = data.azurerm_resource_group.rg.tags

#   subnet {
#     name           = "demo1"
#     address_prefix = "10.0.128.0/28"
#   }

#   subnet {
#     name           = "demo2"
#     address_prefix = "10.0.128.16/28"
#   }
# }

#Call module


