##################################################################################
# VARIABLES
##################################################################################

variable "subscription_id" {
  description = "Azure subscription Id."
}

variable "tenant_id" {
  description = "Azure tenant Id."
}

variable "client_id" {
  description = "Azure service principal application Id"
}

variable "client_secret" {
  description = "Azure service principal application Secret"
}

variable "location" {
  default = "eastus"
}
variable "arm_resource_group_name" {
    default = "ps-noprd-rg1"
}
variable "arm_stroage_account_name" {
    default = "psinfrasdbx10000mysa"
}
variable "container_name" {
    default = "tfstate"
}

##################################################################################
# PROVIDERS
##################################################################################

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  #version         = ">= 1.0" 
}

##################################################################################
# RESOURCES
##################################################################################
resource "azurerm_resource_group" "setup" {
  name = "${var.arm_resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_storage_account" "sa" {
  name = "${var.arm_stroage_account_name}"
  resource_group_name = "${var.arm_resource_group_name}"
  location = "${var.location}"
  account_tier = "Standard"
  account_replication_type = "LRS"

  tags = {
    #environment = "dev"
    environment = terraform.workspace
    costcenter  = "it"

  }
  depends_on = [
      azurerm_resource_group.setup
  ]
}

resource "azurerm_storage_container" "ct" {
  name = "${var.container_name}"
  resource_group_name = "${var.arm_resource_group_name}"
  storage_account_name = "${azurerm_storage_account.sa.name}"

}

##################################################################################
# OUTPUT
##################################################################################
output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "resource_group_name" {
  value = azurerm_resource_group.setup.name
}