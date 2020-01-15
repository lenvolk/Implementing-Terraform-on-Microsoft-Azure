module "us411" {
  #source    = "git::https://github.com/lenvolk/terraform.git//module/Az-Bastion?ref=develop"
  source     = "git::https://github.com/lenvolk/us411.git//?ref=master"
  env        = terraform.workspace
  vnet_type  = var.vnet_type
}
