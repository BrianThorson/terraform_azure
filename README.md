Released under MIT License
Copyright (c) 2022 Brian Thorson.
Refer to <https://opensource.org/licenses/MIT>

This is a Terraform project that lets you try out deployment options in a few easy steps.

This is my initial Terraform deployment environment for Microsoft Azure.

It doesn't really address redundancy, elasticity and the like.  It's just a basic boilerplate to push out a virtual machine, and things you might see like its disk, a NIC, security group and vnet and resource group.  Assign a public IP address to the VM, etc.  Feel free to make the public address an optional item.


Assumptions

This template assumes you have an Azure account, set up your az command line interface, and setup accessto it with your obtained your appId, displayName, password, and tenant.  It also assumes you've exported ARM_SUBSCRIPTION_ID, ARM_TENANT_ID, ARM_CLIENT_ID, ARM_CLIENT_SECRET to your environment.


After switching your desired variables, useful commands may be:

                terraform plan -out main.tfplan
                terraform apply main.tfplan
                terraform plan -destroy -out main.destroy.tfplan
                terraform apply main.destroy.tfplan

                az group list
                az group show --name <resource_group_name>


Tweakable items include:    (look in variables.tf)

                Resource Group name
                Availability set
                Virtual machine
                Disk
                Network interface
                Network security group
                Virtual Network


Useful links

https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine
https://www.terraform.io/language/expressions/conditionals
https://docs.microsoft.com/en-us/azure/developer/terraform/create-resource-group?tabs=azure-cli
https://docs.microsoft.com/en-us/azure/backup/backup-azure-policy-supported-skus
https://docs.microsoft.com/en-us/azure/virtual-machines/sizes
https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-b-series-burstable
https://docs.microsoft.com/en-us/azure/virtual-machines/disks-performance
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk
https://registry.terraform.io/modules/Azure/network-security-group/azurerm/latest
https://romaklimenko.github.io/blog/2021/list-locations/
https://az-vm-image.info/


Released under MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
