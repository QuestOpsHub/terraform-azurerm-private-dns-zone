# Azure Private DNS Zone Terraform Module

Terraform module to create a Private DNS Zone.

# Table of Contents

- [Azure Resource Naming Convention](#azure-resource-naming-convention)
    - [Format](#Format)
    - [Components](#Components)
- [Note](#note)
- [Requirements](#requirements)
- [Providers](#providers)
- [Modules](#modules)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Azure Resource Naming Convention

Resource names should clearly indicate their type, workload, environment, and region. Using a consistent naming convention ensures clarity, uniformity, and easy identification across all repositories.

#### Format

```
<resource_prefix>-<app_or_project>-<environment>-<region>-<optional_unique_suffix>
```

#### Components

| **Component**           | **Description**                                                                      | **Example**             |
|--------------------------|--------------------------------------------------------------------------------------|-------------------------|
| `resource_prefix`        | Short abbreviation for the resource type.                                           | `rg` (Resource Group)   |
| `app_or_project`         | Identifier for the application or project.                                          | `qoh`           |
| `environment`            | Environment where the resource is deployed (`prod`, `dev`, `test`, etc.).           | `prod`                 |
| `region`                 | Azure region where the resource resides (e.g., `cus` for `centralus`).              | `cus`                  |
| `optional_unique_suffix` | Optional unique string for ensuring name uniqueness, often random or incremental.    | `abcd`, `a42n`                 |

## Note

- The for_each argument in the module requires a list of objects that are fully known before the apply stage.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_zone.private_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.dns_vnet_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the Private DNS Zone. Must be a valid domain name. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Specifies the resource group where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_soa_record"></a> [soa\_record](#input\_soa\_record) | (Optional) An soa\_record block | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |
| <a name="input_virtual_network_ids"></a> [virtual\_network\_ids](#input\_virtual\_network\_ids) | -------------------- Dns Zone Vnet Link -------------------- | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Private DNS Zone ID. |
| <a name="output_max_number_of_record_sets"></a> [max\_number\_of\_record\_sets](#output\_max\_number\_of\_record\_sets) | The maximum number of record sets that can be created in this Private DNS zone. |
| <a name="output_max_number_of_virtual_network_links"></a> [max\_number\_of\_virtual\_network\_links](#output\_max\_number\_of\_virtual\_network\_links) | The maximum number of virtual networks that can be linked to this Private DNS zone. |
| <a name="output_max_number_of_virtual_network_links_with_registration"></a> [max\_number\_of\_virtual\_network\_links\_with\_registration](#output\_max\_number\_of\_virtual\_network\_links\_with\_registration) | The maximum number of virtual networks that can be linked to this Private DNS zone with registration enabled. |
| <a name="output_name"></a> [name](#output\_name) | The Private DNS Zone Name. |
| <a name="output_number_of_record_sets"></a> [number\_of\_record\_sets](#output\_number\_of\_record\_sets) | The current number of record sets in this Private DNS zone. |
| <a name="output_soa_record"></a> [soa\_record](#output\_soa\_record) | A soa\_record block |
