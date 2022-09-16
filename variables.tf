// 2022 (Brian Thorson) Copy, move, remove or label any and all parts
// Refer to <https://unlicense.org>
//
//    Changeable items:
//
//    Location
//
//    Availability set
//    Virtual machine
//    Disk
//    Network interface
//    Network security group
//    Virtual Network
//    

// Resource location
variable "rg_location" {
  default     = "westus3"
  description = "Resource group location"
}

// Class identifier goes first (organization ID, if you will)
variable "rg_prefix" {
  default     = "brian"
  description = "Resource group prefix name"
}

// Our current project name
//  The resource group name will be: "rg_prefix-rg_project" in 
//  Azure's resource group panel
variable "rg_project" {
  default     = "winserver19"
  description = "Resource group project name"
}

// Supported VMs can be found here:
//  https://docs.microsoft.com/en-us/azure/backup/backup-azure-policy-supported-skus
//
//  Examples:
//            Image Publisher         Image offer     Image SKU
//            MicrosoftWindowsServer  WindowsServer   2022-Datacenter
//            MicrosoftWindowsServer  WindowsServer   2019-Datacenter
//            MicrosoftWindowsServer  WindowsServer   2016-Datacenter
//            RedHat                  RHEL            6.7
//            RedHat                  RHEL            6.8
//                (6.9, 6.10, 7.2, 7.3, 7.4, 7.5, 7.6)
//            RedHat                  RHEL            7.7
//            Canonical               UbuntuServer    22.04-LTS              
//            Canonical               UbuntuServer    20.04-LTS
//            Canonical               UbuntuServer    18.04-LTS
//            Canonical               UbuntuServer    16.04-LTS

