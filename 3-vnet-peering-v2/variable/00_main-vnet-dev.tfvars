location = "eastus"
sec_resource_group_name = "ps-noprd-rg2"
vnet_name = "security"


##### for remote state

tfsa = "psinfrasdbx10000mysa"
tfcnt = "tfstate"
vnet_key_main = "main-vnet-01-dev.tfstate"
vnet_key_sec  = "sec-vnet-01-dev.tfstate"

##### to peer existing vnet

existing_rg = "network-eus"
existing_vnet = "mngntVNET"