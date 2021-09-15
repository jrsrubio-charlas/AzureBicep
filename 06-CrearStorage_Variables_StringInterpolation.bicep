@description('Location for the resource')
param location string =  resourceGroup().location
@description('Environment to deploy')
param environment string = 'stg'

@minLength(1)
@maxLength(24)
param storageAccountName string = '${environment}workshop1bicep1we06'

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
