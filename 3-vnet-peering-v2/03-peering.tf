

### This is needed if peering resource is in another sub
resource "azurerm_role_definition" "vnet-peering" {
  provider = azurerm.security
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

resource "azurerm_role_assignment" "vnet" {
  provider = azurerm.security
  scope              = module.lib.vnet_id_main
  role_definition_id = azurerm_role_definition.vnet-peering.id
  principal_id       = module.lib.principal_id
}

resource "azurerm_role_assignment" "mngnt_vnet" {
  provider           = azurerm.peering
  #scope              = module.lib.vnet_id_main
  scope              = data.azurerm_virtual_network.existing_vnet.id
  role_definition_id = azurerm_role_definition.vnet-peering.id
  principal_id       = module.lib.principal_id
}
#### END of Role Assignments

resource "azurerm_virtual_network_peering" "mngnt_2_main" {
  provider                     = azurerm.peering
  name                         = "mngnt_2_main"
  resource_group_name          = data.azurerm_resource_group.existing_rg.name 
  virtual_network_name         = data.azurerm_virtual_network.existing_vnet.name 
  # resource_group_name        = var.existing_rg
  # virtual_network_name       = var.existing_vnet
  remote_virtual_network_id    = module.lib.vnet_id_main
  allow_virtual_network_access = true    
  depends_on                   = [azurerm_role_assignment.vnet]
}

resource "azurerm_virtual_network_peering" "main_2_mngnt" {
  provider                     = azurerm.security
  name                         = "main_2_mngnt"
  resource_group_name          = module.lib.rg_name_main    
  virtual_network_name         = module.lib.vnet_name_main   
  remote_virtual_network_id    = data.azurerm_virtual_network.existing_vnet.id 
  allow_virtual_network_access = true    
  depends_on                   = [azurerm_role_assignment.vnet]
}

resource "azurerm_virtual_network_peering" "main" {
# provider                    = azurerm.peering
  provider                     = azurerm.security
  name                         = "main_2_sec"
  resource_group_name          = module.lib.rg_name_main    
  virtual_network_name         = module.lib.vnet_name_main  
  remote_virtual_network_id    = module.lib.vnet_id_sec 
  allow_virtual_network_access = true    
  depends_on                   = [azurerm_role_assignment.vnet]
}

resource "azurerm_virtual_network_peering" "sec" {
  provider                     = azurerm.security
  name                         = "sec_2_main"
  resource_group_name          = module.lib.rg_name_sec
  virtual_network_name         = module.lib.vnet_name_sec
  remote_virtual_network_id    = module.lib.vnet_id_main
  allow_virtual_network_access = true
  depends_on                   = [azurerm_role_assignment.vnet]
}