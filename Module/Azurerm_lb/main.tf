resource "azurerm_lb" "lb" {
  for_each            = var.lbs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_name
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}
