// 2022 (Brian Thorson) Copy, move, remove or label any and all parts
// Refer to <https://unlicense.org>


// Create a resource group for our project
resource "azurerm_resource_group" "rg" {
  location = var.rg_location
  name     = "${var.rg_prefix}-${var.rg_project}"
}


// Declare availability set
resource "azurerm_availability_set" "avail_set" {
  name                = "avail-set"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}


// Create vnet
resource "azurerm_virtual_network" "vnet" {
  name                = "v-net"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}


// Divvy up a subnet
resource "azurerm_subnet" "subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}


// Public and private interfaces
resource "azurerm_network_interface" "network_interface" {
  name                = "network-interface"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}


// External access
resource "azurerm_public_ip" "public_ip" {
  name                = "vm-public-ip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
}


// Allow for RDP
resource "azurerm_network_security_group" "nsg" {
  name                = "rdp-nsg"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  security_rule {
    name                       = "rdp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


// Associate security group(nsg) with with the network interface (nic)
resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.network_interface.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}


// Create a Windows server virtual machine (VM)
resource "azurerm_windows_virtual_machine" rg_project {
  name                = "${var.rg_project}-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = "winuser"
  admin_password      = "Ch@ng3YourPa$$word!!!"
  availability_set_id = azurerm_availability_set.avail_set.id
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,
  ]
  
  // Storage option
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  // The OS that our VM image is based on
  source_image_reference {
    publisher = "${var.vm_publisher}"
    offer     = "${var.vm_offer}"
    sku       = "${var.vm_SKU}"
    version   = "latest"
  }
}