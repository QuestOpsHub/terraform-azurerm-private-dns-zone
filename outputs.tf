#------------------
# Private Dns Zone
#------------------
output "name" {
  description = "The Private DNS Zone Name."
  value       = azurerm_private_dns_zone.private_dns_zone.name
}

output "id" {
  description = "The Private DNS Zone ID."
  value       = azurerm_private_dns_zone.private_dns_zone.id
}

output "soa_record" {
  description = "A soa_record block"
  value       = azurerm_private_dns_zone.private_dns_zone.soa_record
}

output "number_of_record_sets" {
  description = "The current number of record sets in this Private DNS zone."
  value       = azurerm_private_dns_zone.private_dns_zone.number_of_record_sets
}

output "max_number_of_record_sets" {
  description = "The maximum number of record sets that can be created in this Private DNS zone."
  value       = azurerm_private_dns_zone.private_dns_zone.max_number_of_record_sets
}

output "max_number_of_virtual_network_links" {
  description = "The maximum number of virtual networks that can be linked to this Private DNS zone."
  value       = azurerm_private_dns_zone.private_dns_zone.max_number_of_virtual_network_links
}

output "max_number_of_virtual_network_links_with_registration" {
  description = "The maximum number of virtual networks that can be linked to this Private DNS zone with registration enabled."
  value       = azurerm_private_dns_zone.private_dns_zone.max_number_of_virtual_network_links_with_registration
}