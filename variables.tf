//
//  2022 (Brian Thorson) Copy, move, remove or label any and all parts
//  Refer to <https://unlicense.org>
//
//    Changeable items:
//
//    Resource Group Location
//    Resource Group Naming
//    Virtual machine type
//    Disk options
//    Network interface
//    Network security group
//    Virtual Network
//    

//
//  Resource group location       (possible locations at bottom)
//
variable "rg_location" {
  default     = "westus3"
  description = "Resource group location"
}

//
//  Resource group naming         ("rg_prefix-rg_project")
//
variable "rg_prefix" {
  default     = "ubuntu"
  description = "Resource group prefix name"
}

variable "rg_project" {
  //default     = "winserver19"
  default     = "assign3"
  description = "Resource group project name"
}

//
//  Source image properties:  publisher, offer, SKU
//                                      (VM Examples at bottom)
//
variable "vm_publisher" {
  default     = "Canonical"
  description = "VM Publisher"
}

variable "vm_offer" {
  default     = "UbuntuServer"
  description = "VM Offer"
}

variable "vm_SKU" {
  default     = "18.04-LTS"
  description = "VM SKU"
}

//
//  VM size & storage:    size, storage account type, caching
//                                      (VM Examples at bottom)
//
variable "vm_size" {
  default     = "Standard_B1s"
  description = "VM Size"
}

variable "vm_storage_account_type" {
  default               = "Standard_LRS"
  description           = "VM Managed disk type"
}

variable "vm_disk_caching" {
  default               = "ReadWrite"
  description           = "VM Disk caching"
}

//
//  VM admin username & password    (self-explanatory)
//
variable "vm_admin_username" {
  default               = "ubuntu"
  description           = "VM admin user name"
}

variable "vm_admin_password" {
  default               = "Ch@ng3YourPa$$word!!!"
  description           = "VM admin user password"
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

/*  Storage account type
      Standard_LRS        StandardSSD_ZRS     Premium_LRS         Premium_ZRS
      StandardSSD_LRS     UltraSSD_LRS */

/*  Disk caching
      ReadWrite        Read */


/*  VM sizes      For this project we'll just list B series
                  Naturally, there a lot more options
                  https://docs.microsoft.com/en-us/azure/virtual-machines/sizes

      Standard_B1s            Standard_B1ls2    Standard_B1ms     Standard_B2s
      Standard_B2ms           Standard_B4ms     Standard_B8ms     Standard_B12ms    
      Standard_B20ms          StandardStandard_B16ms */