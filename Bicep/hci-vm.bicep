param name string
param location string
param customLocationId string
param hardwareProfile object
param subscriptionId string
param resourceGroupName string
param osType string
param adminUsername string

@secure()
param adminPassword string

resource hci_vm 'Microsoft.AzureStackHCI/virtualmachines@2021-09-01-preview' = {
  name: name
  location: location
  properties: {
    resourceName: name
    hardwareProfile: hardwareProfile
    osProfile: {
      adminUsername: adminUsername
      adminPassword: adminPassword
      osType: osType
      computerName: name
    }
    storageProfile: {
      imageReference: {
        name: '/subscriptions/*******/resourceGroups/Treeby-HCI-146/providers/Microsoft.AzureStackHCI/galleryImages/sp-win2k22-server2'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic1.id
        }
      ]
    }
  }
  extendedLocation: {
    type: 'CustomLocation'
    name: customLocationId
  }
}

resource nic1 'Microsoft.AzureStackHCI/networkinterfaces@2021-09-01-preview' = {
  name: 'nic1'
  location: location
  extendedLocation: {
    type: 'CustomLocation'
    name: customLocationId
  }
  properties: {
    resourceName: 'nic1'
    ipConfigurations: [
      {
        name: 'nic1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: '/subscriptions/*****/resourceGroups/Treeby-HCI-146/providers/Microsoft.AzureStackHCI/virtualnetworks/treeby-vnet-23'
          }
        }
      }
    ]
  }
}
