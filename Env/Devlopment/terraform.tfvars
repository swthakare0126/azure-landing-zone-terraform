
resource_group = {
  rg1 = {
    name     = "fibre"
    location = "centralindia"
  }
   rg2 = {
    name     = "line"
    location = "centralindia"
  }
   rg3 = {
    name     = "dark-line"
    location = "centralindia"
  }
     rg4 = {
    name     = "light-line"
    location = "centralindia"
  }

}
virtual_network = {
  vnet1 = {
    name                = "fibre-vnet"
    location            = "centralindia"
    resource_group_name = "fibre"
    address_space       = ["10.0.0.0/16"]

  }
}
subnet = {
  subnets1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "fibre"
    virtual_network_name = "fibre-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnets2 = {
    name                 = "backend-subnet"
    resource_group_name  = "fibre"
    virtual_network_name = "fibre-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnets3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "fibre"
    virtual_network_name = "fibre-vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }
}
publicip = {
  pubips1 = {
    name                = "frontend-pip"
    resource_group_name = "fibre"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pubips2 = {
    name                = "backend-pip"
    resource_group_name = "fibre"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pubips3 = {
    name                = "bastion-pip"
    resource_group_name = "fibre"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pubips4 = {
    name                = "lb-pip"
    resource_group_name = "fibre"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pubips5 = {
    name                = "appgw-pip"
    resource_group_name = "fibre"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}
virtual_machin = {
  vm1 = {
    nic_name                      = "frontend-nic"
    location                      = "centralindia"
    resource_group_name           = "fibre"
    ip_name                       = "internal"
    private_ip_address_allocation = "Dynamic"
    data_name                     = "frontend-subnet"
    virtual_network_name          = "fibre-vnet"
    pip_name                      = "frontend-pip"
    vm_name                       = "frontend"
    size                          = "Standard_B1s"
    admin_username                = "swthakar"
    admin_password                = "Jaigajanan@2026"
  }

  vm2 = {
    nic_name                      = "backend-nic"
    location                      = "centralindia"
    resource_group_name           = "fibre"
    ip_name                       = "internal"
    private_ip_address_allocation = "Dynamic"
    data_name                     = "backend-subnet"
    virtual_network_name          = "fibre-vnet"
    pip_name                      = "backend-pip"
    vm_name                       = "backend"
    size                          = "Standard_B1s"
    admin_username                = "swthakar"
    admin_password                = "Jaigajanan@2026"
  }
}

nsg = {
  nsg1 = {
    name                = "frontend-nsg"
    location            = "centralindia"
    resource_group_name = "fibre"
  }
}

bastion = {
  bastion1 = {
    name                 = "bastion-host"
    location             = "centralindia"
    resource_group_name  = "fibre"
    ip_config_name       = "bastion-ip-config"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "fibre-vnet"
    pip_name             = "bastion-pip"
  }
}

key_vault = {
  kv1 = {
    name                = "fibre-kv-12345"
    location            = "centralindia"
    resource_group_name = "fibre"
    sku_name            = "standard"
  }
}

lb = {
  lb1 = {
    name                 = "frontend-lb"
    location             = "centralindia"
    resource_group_name  = "fibre"
    frontend_ip_name     = "frontend-lb-ip"
    pip_name             = "lb-pip"
  }
}

appgw = {
  appgw1 = {
    name                       = "frontend-appgw"
    resource_group_name        = "fibre"
    location                   = "centralindia"
    sku_name                   = "Standard_v2"
    sku_tier                   = "Standard_v2"
    sku_capacity               = 2
    gateway_ip_name            = "appgw-ip-config"
    subnet_name                = "frontend-subnet"
    virtual_network_name       = "fibre-vnet"
    frontend_port_name         = "frontend-port"
    frontend_port              = 80
    frontend_ip_name           = "frontend-ip"
    pip_name                   = "appgw-pip"
    backend_address_pool_name  = "backend-pool"
    backend_http_settings_name = "backend-http-settings"
    http_listener_name         = "http-listener"
    request_routing_rule_name  = "routing-rule"
    priority                   = 10
  }
}
