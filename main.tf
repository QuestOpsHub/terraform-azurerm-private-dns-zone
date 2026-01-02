#------------------
# Private Dns Zone
#------------------
resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = var.name
  resource_group_name = var.resource_group_name

  dynamic "soa_record" {
    for_each = try(var.soa_record, {}) != {} ? [var.soa_record] : []
    content {
      email        = soa_record.value.soa_record
      expire_time  = lookup(soa_record.value, "expire_time", 2419200)
      minimum_ttl  = lookup(soa_record.value, "minimum_ttl", 10)
      refresh_time = lookup(soa_record.value, "refresh_time", 3600)
      retry_time   = lookup(soa_record.value, "retry_time", 300)
      ttl          = lookup(soa_record.value, "ttl", 3600)
      tags         = lookup(soa_record.value, "tags", {})
    }
  }

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["creation_timestamp"],
    ]
  }
}

#--------------------
# Dns Zone Vnet Link
#--------------------
resource "azurerm_private_dns_zone_virtual_network_link" "dns_vnet_link" {
  for_each              = { for vnet_id in var.virtual_network_ids : vnet_id.name => vnet_id }
  name                  = each.value.name
  resource_group_name   = azurerm_private_dns_zone.private_dns_zone.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
  virtual_network_id    = each.value.vnet_id
  registration_enabled  = lookup(each.value, "registration_enabled", false)

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["creation_timestamp"],
    ]
  }
}