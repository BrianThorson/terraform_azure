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

// Resource group location
variable "rg_location" {
  default     = "westus3"
  description = "Resource group location"
}


// Resource group naming convention  = "rg_prefix-rg_project"
// *prefix*
variable "rg_prefix" {
  default     = "brian"
  description = "Resource group prefix name"
}
// *project*
variable "rg_project" {
  default     = "winserver19"
  description = "Resource group project name"
}

variable "vm_publisher" {
  default     = "MicrosoftWindowsServer"
  description = "VM Publisher"
}

variable "vm_offer" {
  default     = "WindowsServer"
  description = "VM Offer"
}

variable "vm_SKU" {
  default     = "2019-Datacenter"
  description = "VM SKU"
}

/*  Locations
      asiapacific         australia           australiacentral    australiacentral2
      australiaeast       australiasoutheast  brazil              brazilsouth
      brazilsouth         brazilsoutheast     canada              canadacentral
      canadaeast          centralindia        centralus           centraluseuap
      centralusstage      eastasia            eastasiastage       eastus
      eastus2             eastus2euap         eastus2stage        eastusstage
      europe              francecentral       francesouth         germanynorth
      germanywestcentral  global              india               japan
      japaneast           japanwest           jioindiawest        koreacentral
      koreasouth          northcentralus      northcentralusstage northeurope   
      norwayeast          norwaywest          southafricanorth    southafricawest
      southcentralus      southcentralusstage southeastasia       southeastasiastage
      southindia          switzerlandnorth    switzerlandwest     uaecentral
      uaenorth            uk                  uksouth             ukwest
      unitedstates        westcentralus       westeurope          westindia
      westus              westus2             westus2stage        westus3
      westusstage */

/*  VM Examples:
      Image Publisher         Image offer     Image SKU
      ----------------------  -----------     ---------------
      MicrosoftWindowsServer  WindowsServer   2022-Datacenter
      MicrosoftWindowsServer  WindowsServer   2019-Datacenter
      MicrosoftWindowsServer  WindowsServer   2016-Datacenter
      RedHat                  RHEL            6.7
      RedHat                  RHEL            6.8
          (6.9, 6.10, 7.2, 7.3, 7.4, 7.5, 7.6)
      RedHat                  RHEL            7.7
      Canonical               UbuntuServer    22.04-LTS              
      Canonical               UbuntuServer    20.04-LTS
      Canonical               UbuntuServer    18.04-LTS
      Canonical               UbuntuServer    16.04-LTS */

