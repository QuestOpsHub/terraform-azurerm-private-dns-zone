#------------------
# Private Dns Zone
#------------------
variable "name" {
  description = "(Required) The name of the Private DNS Zone. Must be a valid domain name. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) Specifies the resource group where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "soa_record" {
  description = "(Optional) An soa_record block"
  type        = any
  default     = {}
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

#--------------------
# Dns Zone Vnet Link
#--------------------
variable "virtual_network_ids" {}