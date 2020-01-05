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
#### Remote State
variable tfsa {
  default = ""
}

variable tfcnt {
  default = ""
}

variable vnet_key_main {
    default = ""
}
variable vnet_key_sec {
    default = ""
}

variable ackey {
  default = ""
}
