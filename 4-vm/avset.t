resource "azurerm_availability_set" "csr_avset-1"{
  name                         = "csr-avset-1"
  location              = data.azurerm_resource_group.my_rg.location
  resource_group_name   = data.azurerm_resource_group.my_rg.name
  managed                      = true
  platform_fault_domain_count  = 2

    tags = {
    environment = terraform.workspace
    EONID       = var.eonid
  }

}

# resource "azurerm_availability_set" "csr_avset-2"{
#   name                         = "csr-avset-2"
#   location                     = "${data.azurerm_resource_group.rgvm.location}"
#   resource_group_name          = "${data.azurerm_resource_group.rgvm.name}"
#   managed                      = true
#   platform_fault_domain_count  = 2

#     tags = {
#     environment = terraform.workspace
#     EONID       = var.eonid
#   }

# }