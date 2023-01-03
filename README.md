# Azure Resource Bridge - Bicep, ARM Template and Terraform Usage

This repo contains sample code for provisioning a VM in your locally hosted [HCI Cluster](https://azure.microsoft.com/en-au/products/azure-stack/hci/) using the [Azure Resource Bridge](https://learn.microsoft.com/en-us/azure/azure-arc/resource-bridge/overview). 

## Bicep

The Bicep file located here - [/Bicep/hci-vm.bicep](Bicep/hci-vm.bicep) deploys a VM using the Azure Resource Bridge. The parameters are taken from the [parameters file](Bicep/hci-vm.parameters.json). 


```
rgName="ArcTest-BICEP"
# Create resource group
az group create --name $rgName --location eastus
# Deploy bicep file
az deployment group create --resource-group $rgName --template-file ./hci-vm.bicep --parameters @./hci-vm.parameters.json
```

