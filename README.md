# Azure Resource Bridge - Bicep, ARM Template and Terraform Usage

This repo contains sample code for provisioning a VM in your locally hosted [HCI Cluster](https://azure.microsoft.com/en-au/products/azure-stack/hci/) using the [Azure Resource Bridge (ARB)](https://learn.microsoft.com/en-us/azure/azure-arc/resource-bridge/overview). 

## Bicep

The Bicep file located here - [/Bicep/hci-vm.bicep](Bicep/hci-vm.bicep) deploys a VM using the Azure Resource Bridge. The parameters are taken from the [parameters file](Bicep/hci-vm.parameters.json). 


```
rgName="ArcTest-BICEP"
# Create resource group
az group create --name $rgName --location eastus
# Deploy bicep file
az deployment group create --resource-group $rgName --template-file ./hci-vm.bicep --parameters @./hci-vm.parameters.json
```

## ARM Template 
The ARM Template file is located here - [/ArmTemplate/hci-vm.json](ArmTemplate/hci-vm.bicep). It deploys a VM using the Azure Resource Bridge. The parameters file is located [here](ArmTemplate/hci-vm.parameters.json)

```
rgName="ArcTest-ARM"
# Create resource group
az group create --name $rgName --location eastus
# Deploy ARM template
az deployment group create --resource-group $rgName --template-file ./hci-vm.json --parameters @./hci-vm.parameters.json
```

## Terraform
The terraform code for deploying a VM using the Azure ARB to a HCI cluster can be found [here](terraform/). It is using the AZAPI Resource which is documented [here](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/azapi_resource). 

```
terraform init
terraform plan
terraform apply 
```