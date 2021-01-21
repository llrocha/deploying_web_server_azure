# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

# Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.


# Getting Started

We will try to explain how we will use the Packer to create a VM image from a WEB server, and also how to distribute the image in the Azure cloud with TerraForm. Let's divide into two topics:

1) Packer - Creating and customizing images
2) TerraForm - Distributing VMs
---
## 1) Packer - Creating images

The Packer image package is divided into this files:
- server.json - file with VM definitions and post built jobs
- variables.json - file with project variable parameters

#### server.json
This file has three sections:
- variables
This section contains variables names, used in next sections. You can create enviroment variables, ARM_CLIENT_ID and ARM_CLIENT_SECRET, to pass it to the image, the user and password of admin user.

- builders
In this section, we configure an image from, select our image, in os_type,
image_publisher, image_offer, image_sku. To list all available images that you can play:
```
az vm image list --all -o table
```

- provisioners
In this section, we specify what we need to do to configure the image, before turn it on.

### Running Packer
You will need your subscription_id to run the Packer, to find out, run:
```
az account list
```
Select the field 'id', and take their value to pass to the Packer.

To run the Packer, just do as in the following example:
```
packer build -var 'subscription_id=123vs0aa-2237-4051-23c5-141c1414111b' server.json
```
---
## 2) TerraForm - Distributing VMs
The Terraform project contains this files:

- main.tf
- vars.tf

#### main.tf
In our project we have this resources into main.tf:

- azurerm_resource_group - in this section we need to say what is our resource group in Azure.
- azurerm_virtual_network - config for a virtual network
- azurerm_subnet - config for a subnet
- azurerm_network_interface - config for a network interface
- azurerm_public_ip - config for a public IP
- azurerm_lb - config for a Load Balancer
- azurerm_lb_backend_address_pool - config for a Load Balancer Pool
- azurerm_network_interface_backend_address_pool_association - Association from NIC to Backend Adress Pool
- azurerm_availability_set - config for a availability set
- azurerm_linux_virtual_machine - image used for our virtual machine
- azurerm_managed_disk - 


#### vars.tf
You can change de values of variables listed in this file, changing the value of default field, to value you want.<br>
You can see more about variables in: https://www.terraform.io/docs/configuration/variables.html<br>
If you want to pass var values from command line, you can do this:
```
terraform apply -var="image_id=ami-abc123"
```

### Running Terraform:
```
terraform plan -out solution.plan
```
This command does nothing in cloud, only calculate and verify errors and create a solution.plan file.

```
terraform apply solution.plan
```
This command will create resources configured into Azure Cloud.

```
terraform destroy
```
This command will destroy resources created into Azure Cloud, with previous command.