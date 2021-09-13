param location string =  resourceGroup().location
param environment string = 'stg'
param globalRedundancy bool = true

@minLength(1)
@maxLength(24)
param storageAccountName string = '${environment}workshop1bicep1we01'

var storageSKU = globalRedundancy ? 'Standard_GRS' : 'Standard_LRS'


resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  name: '${stg.name}/default/container1'
}

resource stg 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: storageSKU
  }
}


output storageId string = stg.id
output blobEndpoint string = stg.properties.primaryEndpoints.blob
