// 2022 (Brian Thorson) Copy, move, remove or label any and all parts
// Refer to <https://unlicense.org>

// Output our resource group name
output "rg_name" {
  value = azurerm_resource_group.rg.name
}
