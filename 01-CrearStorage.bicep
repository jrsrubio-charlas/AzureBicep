resource stg 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: 'workshop1bicep1we01'
  location: 'westeurope'
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  tags: {
    project: 'Workshop'
    team: 'Team 10'
  }
}
