// 2022 (Brian Thorson) Copy, move, remove or label any and all parts.
// Refer to <https://unlicense.org>.

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


License

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <https://unlicense.org>