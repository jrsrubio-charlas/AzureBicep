@description('Location for the resource')
param location string =  'westeurope'

@minLength(1)
@maxLength(24)
param storageAccountName string = 'workshop1bicep1we03'


resource stg 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
