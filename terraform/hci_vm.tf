resource "azapi_resource" "nic1" {
  schema_validation_enabled = false
  type                      = "Microsoft.AzureStackHCI/networkinterfaces@2021-09-01-preview"
  name                      = "nic1"
  parent_id                 = module.rg1.id

  location = var.location


  body = jsonencode({
    extendedLocation = {
      type = "CustomLocation"
      name = var.customLocationId
    }
    properties = {
      resourceName = var.vm_name
      ipConfigurations = [
        {
          name = "nic1"
          properties = {
            privateIPAllocationMethod = "Dynamic"
            subnet = {
              id = var.localVnetID
            }
          }
        }
      ]
    }
  })


  tags = var.tags

  response_export_values = ["properties"]
}


resource "azapi_resource" "hci_vm1" {
  schema_validation_enabled = false
  type                      = "Microsoft.AzureStackHCI/virtualmachines@2021-09-01-preview"
  name                      = var.vm_name
  parent_id                 = module.rg1.id

  location = var.location

  body = jsonencode({
    extendedLocation = {
      type = "CustomLocation"
      name = var.customLocationId
    }
    properties = {
      resourceName = var.vm_name
      hardwareProfile = {
        processors = var.vm_cpu_cores
        memoryGB   = var.vm_ram
      }
      osProfile = {
        adminUsername = var.vm_username
        adminPassword = var.vm_password
        osType : var.vm_os_type
        computerName = var.vm_name
      }
      storageProfile = {
        imageReference = {
          name = var.vm_os_image_reference
        }
      }
      networkProfile = {
        networkInterfaces = [
          {
            id = azapi_resource.nic1.id
          }
        ]
      }
    }
  })

  tags = var.tags

  response_export_values = ["properties"]
}
