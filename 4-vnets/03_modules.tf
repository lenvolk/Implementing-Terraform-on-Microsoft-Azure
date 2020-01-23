#Call module
module "Az-VirtualNetwork-Demo" {
  source                      = "git::https://github.com/lenvolk/terraform-azurerm-Az-VirtualNetwork.git//?ref=dev"
  net_prefix                  = "00-spokenet"
  network_resource_group_name = "ps-vnets"
  virtual_networks            = var.virtual_networks
  subnets                     = var.subnets
  #route_tables                = var.route_tables
  #network_security_groups     = var.network_security_groups
  #pips                        = var.pips
  #vnets_to_peer               = var.vnets_to_peer
  net_additional_tags         = var.net_additional_tags

  # providers        = {
  # azurerm          = azurerm.spokenet
  # }

}