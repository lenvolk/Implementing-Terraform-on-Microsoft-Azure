module "us411" {
  #source    = "git::https://github.com/lenvolk/terraform.git//module/Az-Bastion?ref=develop"
  source     = "git::https://github.com/lenvolk/us411.git//?ref=master"
  env        = terraform.workspace
  os         = var.os
  vm_type    = var.vm_type
  region     = data.azurerm_resource_group.my_rg.location
}


# module "Create-AzureRmLoadBalancer-Demo" {
#   source                 = "git::https://github.com/lenvolk/terraform-azurerm-Az-LoadBalancer.git//?ref=master"
#   version                = "0.1.1"
#   Lbs                    = var.Lbs
#   LbRules                = var.LbRules
#   lb_prefix              = "myproductvm-perimeter"
#   lb_location            = data.azurerm_resource_group.rg.location
#   lb_resource_group_name = data.azurerm_resource_group.rg.name
#   Lb_sku                 = "basic"
#   subnets_ids            = [for x in azurerm_virtual_network.Demo.subnet : x.id]
#   lb_additional_tags     = var.additional_tags
# }

module "Az-Vm-Demo" {
  #source                  = "JamesDLD/Az-Vm/azurerm"
  #version                 = "0.1.2"
  source                  = "git::https://github.com/lenvolk/terraform-azurerm-Az-Vm.git//?ref=master"
  sa_bootdiag_storage_uri = "https://infrasdbx1vpcjdld1.blob.core.windows.net/"            #(Mandatory)
  subnets_ids             = [for x in azurerm_virtual_network.existing_vnet.subnet : x.id] #(Mandatory)
  linux_vms               = var.linux_vms                                                  #(Mandatory)
  windows_vms             = var.windows_vms                                                #(Mandatory)
  vm_resource_group_name  = data.azurerm_resource_group.rg.name
  vm_prefix               = "myproductvm" #(Optional)
  admin_username          = "myadmlogin"
  admin_password          = "Myadmlogin_StoredInASecretFile?"
  internal_lb_backend_ids = module.Create-AzureRmLoadBalancer-Demo.lb_backend_ids #(Optional)
  vm_additional_tags      = var.additional_tags                                   #(Optional)
  #All other optional values
  /*
  key_vault_name          = "leccaasgalqualkv1"                                   #(Optional)
  key_vault_rgname        = "caas-infra1-svcd-gal-qual-rg1"                       #(Optional) Use the RG's location if not set
  vm_location                       = element(module.Az-VirtualNetwork-Demo.vnet_locations, 0) #(Optional) Use the RG's location if not set
  workspace_name                    = ""                                                       #(Optional)
  workspace_resource_rgname         = ""                                                       #(Optional) Use the RG's location if not set
  enable_log_analytics_dependencies = "true"                                                   #(Optional) Default is false
  nsgs_ids                          = module.Az-VirtualNetwork-Demo.network_security_group_ids #(Optional)
  public_ip_ids                     = module.Az-VirtualNetwork-Demo.public_ip_ids              #(Optional)
  public_lb_backend_ids             = ["public_backend_id1", "public_backend_id1"]             #(Optional)
  recovery_services_vault_name      = "infra-jdld-infr-rsv1"                                   #(Optional)
  recovery_services_vault_rgname    = data.azurerm_resource_group.rg.name                      #(Optional) Use the RG's location if not set
*/

}
