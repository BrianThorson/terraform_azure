Terraform_Azure         (Released under MIT License)

This is my initial Terraform deployment environment for Microsoft Azure.

It's a project that lets you try out Azure deployment options in a few easy steps.

It'd definitely not intended for production, but it will create some resources for you so you can decide how to implement a few things in a future project.  It doesn't really address redundancy, elasticity and the like.  It's just a basic boilerplate to push out a virtual machine, and things you might see like its disk, a NIC, security group, virtual net, and resource group.  Assign a public IP address to the VM, etc.  Feel free to make the public address an optional item.  Things like that.


Assumptions

This template assumes you have an Azure account, set up your az command line interface, and setup access to it with your obtained your appId, displayName, password, and tenant.  It also assumes you've exported ARM_SUBSCRIPTION_ID, ARM_TENANT_ID, ARM_CLIENT_ID, ARM_CLIENT_SECRET to your environment.


After switching your desired variables, useful commands may be:

                terraform plan -out main.tfplan
                terraform apply main.tfplan
                terraform plan -destroy -out main.destroy.tfplan
                terraform apply main.destroy.tfplan

                az group list
                az group show --name <resource_group_name>


Look in variables.tf for items to adjust

                Resource Group name
                Availability set
                Virtual machine
                Disk
                Network interface
                Network security group
                Virtual Network

Future plans

    Maybe add some looping to do things like add multiple IAM users or roles, among other things.  
    Terraform doesn't support traditional if-then conditionals, but it can be achieved.  
    It'd be nice to have condition where you create one thing, but not the other in Terraform.  
    There is a great article here: https://blog.gruntwork.io/terraform-tips-tricks-loops-if-statements-and-gotchas-f739bbae55f9#0223.  
    I'll try that out some time.  Or if someone comes across this and wants to add something along those lines, that would be super keen.

    I'll probably try to add some branches for more complex implementations like peering setups, etc.

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
