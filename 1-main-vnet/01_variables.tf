#############################################################################
# VARIABLES
#############################################################################

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

variable "rg_infr_name" {
  description = "Resource group name that will host our services"
    type = string
    default = "demo-rg"
}
######

variable "env" {
  default = "Development"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "vnet_name" {
  type    = string
  default = "demo-vnet"
}

variable "subnet_prefixes" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "subnet_names" {
  type    = list(string)
  default = ["web", "database"]
}