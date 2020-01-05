

### This is needed if peering resource is in another sub
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


resource "azurerm_role_assignment" "vnet" {
  scope              = module.lib.vnet_id_main
  role_definition_id = azurerm_role_definition.vnet-peering.id
  principal_id       = module.lib.principal_id
}

resource "azurerm_virtual_network_peering" "main" {
  name                         = "main_2_sec"
  resource_group_name          = module.lib.rg_name_main    
  virtual_network_name         = module.lib.vnet_name_main  
  remote_virtual_network_id    = module.lib.vnet_id_sec 
  allow_virtual_network_access = true    
  #provider                    = azurerm.peering

  depends_on                   = [azurerm_role_assignment.vnet]
}

resource "azurerm_virtual_network_peering" "sec" {
  name                         = "sec_2_main"
  resource_group_name          = module.lib.rg_name_sec
  virtual_network_name         = module.lib.vnet_name_sec
  remote_virtual_network_id    = module.lib.vnet_id_main
  allow_virtual_network_access = true
  #provider                     = azurerm.security

  depends_on                   = [azurerm_role_assignment.vnet]
}