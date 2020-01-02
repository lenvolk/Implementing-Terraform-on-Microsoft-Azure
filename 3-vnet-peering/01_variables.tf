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

# variable "sec_resource_group_name" {
#   type    = string
#   default = "demo-security"
# }

# variable "location" {
#   type    = string
#   default = "eastus"
# }

# variable "vnet_name" {
#   type    = string
#   default = "demo-vnet"
# }

# variable "vnet_cidr_range" {
#   type    = string
#   default = "10.1.0.0/16"
# }

# variable "sec_subnet_prefixes" {
#   type    = list(string)
#   default = ["10.1.0.0/24", "10.1.1.0/24"]
# }

# variable "sec_subnet_names" {
#   type    = list(string)
#   default = ["siem", "inspect"]
# }