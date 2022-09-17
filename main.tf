//
//  main.tf
//  2022 (Brian Thorson) Copy, move, remove or label any and all parts
//  Refer to <https://unlicense.org>
//


//
//  Create a resource group for our project
//
resource "azurerm_resource_group" "rg" {
  location = var.rg_location
  name     = "${var.rg_prefix}-${var.rg_project}"
}

//
//  Declare availability set
//
resource "azurerm_availability_set" "avail_set" {
  name                = "avail-set"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

//
// Create virtual network   "vnet"
//
resource "azurerm_virtual_network" "vnet" {
  name                = "v-net"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

//
// Divvy up a subnet
//
resource "azurerm_subnet" "subnet" {
  name                    = "internal"
  resource_group_name     = azurerm_resource_group.rg.name
  virtual_network_name    = azurerm_virtual_network.vnet.name
  address_prefixes        = ["10.0.1.0/24"]
}

//
//  Public and private interfaces
//
resource "azurerm_network_interface" "network_interface" {
  name                              = "network-interface"
  location                          = azurerm_resource_group.rg.location
  resource_group_name               = azurerm_resource_group.rg.name

  ip_configuration {
    name                            = "internal"
    subnet_id                       = azurerm_subnet.subnet.id
    private_ip_address_allocation   = "Dynamic"

    public_ip_address_id            = azurerm_public_ip.public_ip.id
  }
}

//
//  External access       (public IP address)
//
resource "azurerm_public_ip" "public_ip" {
  name                            = "vm-public-ip"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  allocation_method               = "Dynamic"
}

//
// Allow for RDP, HTTP, etc.
//
resource "azurerm_network_security_group" "nsg" {
  name                            = "rdp-nsg"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location

   security_rule {
    name                          = "ssh"
    priority                      = 202
    direction                     = "Inbound"
    access                        = "Allow"
    protocol                      = "Tcp"
    source_port_range             = "*"
    destination_port_range        = "22"
    source_address_prefix         = "*"
    destination_address_prefix    = "*"
    description                   = "myssh"
  }
   /* security_rule {
    name                          = "rdp"
    priority                      = 201
    direction                     = "Inbound"
    access                        = "Allow"
    protocol                      = "Tcp"
    source_port_range             = "*"
    destination_port_range        = "3389"
    source_address_prefix         = "*"
    destination_address_prefix    = "*"
    description                   = "myrdp"
  }
  security_rule {
    name                          = "http"
    priority                      = 200
    direction                     = "Inbound"
    access                        = "Allow"
    protocol                      = "Tcp"
    source_port_range             = "*"
    destination_port_range        = "80"
    source_address_prefix         = "*"
    destination_address_prefix    = "*"
    description                   = "myhttp"
  } */
}

//
// Associate network security group(NSG) to network interface (NIC)
//
resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id        = azurerm_network_interface.network_interface.id
  network_security_group_id   = azurerm_network_security_group.nsg.id
}

//
// Create a Windows server virtual machine (VM)
//
resource "azurerm_linux_virtual_machine" rg_project {

  // Resource group (RG) name, location, and availability set
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  availability_set_id     = azurerm_availability_set.avail_set.id
  
  // Virtual machine name
  name                    = "${var.rg_project}-vm"

  //  Image type
  source_image_reference {
    publisher             = "${var.vm_publisher}"
    offer                 = "${var.vm_offer}"
    sku                   = "${var.vm_SKU}"
    version               = "latest"
  }

  //  Size & storage
  size                    = "${var.vm_size}"
  os_disk {
    caching               = "${var.vm_disk_caching}"
    storage_account_type  = "${var.vm_storage_account_type}"
  }

  //  Admin user
  admin_username          = "${var.vm_admin_username}"
  admin_password          = "${var.vm_admin_password}" 
  
  disable_password_authentication = false
  //  ssh 
  //admin_ssh_key {
  //  username   = "adminuser"
  //  public_key = file("~/.ssh/id_rsa.pub")
  // }
  
  //  NIC
  network_interface_ids   = [
    azurerm_network_interface.network_interface.id,
  ]

}