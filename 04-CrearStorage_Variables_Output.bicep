@description('Location for the resource')
param location string =  'westeurope'

@minLength(1)
@maxLength(24)
param storageAccountName string = 'workshop1bicep1we04'

var storageSKU = 'Standard_LRS'


resource stg 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: storageSKU
  }
}

output storageId string = stg.id
