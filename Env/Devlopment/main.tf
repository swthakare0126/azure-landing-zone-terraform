

module "rg" {
  source = "../../Module/Azurerm_resource_group"
  rgs    = var.resource_group
}
module "vnet" {
  depends_on = [module.rg]
  source     = "../../Module/Azurerm_virtual_Network"
  vnets      = var.virtual_network
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../Module/Azurerm_Subnet"
  subnets    = var.subnet
}
module "pip" {
  depends_on = [module.rg]
  source     = "../../Module/Azurerm_Public_IP"
  pubips     = var.publicip
}

module "vm" {
  depends_on = [module.pip, module.subnet]
  source     = "../../Module/Azurerm_Virtual_Machin"
  vms        = var.virtual_machin
}

module "nsg" {
  depends_on = [module.rg]
  source     = "../../Module/Azurerm_network_security_group"
  nsgs       = var.nsg
}

module "bastion" {
  depends_on = [module.rg, module.subnet, module.pip]
  source     = "../../Module/Azurerm_bastion_host"
  bastions   = var.bastion
}

module "kv" {
  depends_on = [module.rg]
  source     = "../../Module/Azurerm_key_vault"
  key_vaults = var.key_vault
}

module "lb" {
  depends_on = [module.rg, module.pip]
  source     = "../../Module/Azurerm_lb"
  lbs        = var.lb
}

module "appgw" {
  depends_on = [module.rg, module.subnet, module.pip]
  source     = "../../Module/Azurerm_application_gateway"
  appgws     = var.appgw
}
