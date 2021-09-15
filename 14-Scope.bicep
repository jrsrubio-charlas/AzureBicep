targetScope = 'subscription'

resource rsg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'BicepWorkshopRGScope'
  location:  'westeurope'
}

module stg '04-CrearStorage_Variables_Output.bicep' = {
  name: 'createStorage'
  scope: resourceGroup(rsg.name)
  params: {
    location: rsg.location
    storageAccountName: 'storagefromscope'
  }
}

output storageName string = stg.outputs.storageId
output resourceId string = rsg.id
