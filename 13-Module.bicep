module cont '04-CrearStorage_Variables_Output.bicep' = {
  name: 'createStorage'
  params: {
    location: 'westeurope'
    storageAccountName: 'storagefrommodule'
  }
}

output storageName string = cont.outputs.storageId
