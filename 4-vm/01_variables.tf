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
#### Remote State Variables
variable tfsa {
  default = ""
}

variable tfcnt {
  default = ""
}

variable vnet_key_main {
    default = ""
}
variable ackey {
  default = ""
}

#### us411 Variables
variable "env"          { default = "dev" }
variable "os"           { default = "win" }
variable "vm_type"      { default = "web" }
variable "region"       { default = "eastus" }

#################
variable "eonid"        { default = "12345" }

variable "additional_tags" {
  default = {
    iac = "terraform"
  }
}
