param environment string = 'stg'

@minLength(1)
@maxLength(24)
param storageAccountName string = '${environment}workshop1bicep1we01'

param containerName array = [
  'containerA'
  'containerB'
  'containerC'
]

resource stg 'Microsoft.Storage/storageAccounts@2021-04-01' existing = {
  name: storageAccountName
}

resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = [for container in containerName: {
  name: '${stg.name}/default/${container}'
}]

output storageId string = stg.id
output blobEndpoint string = stg.properties.primaryEndpoints.blob
output containersId array = [for i in range (0, length(containerName)): blob[i].id]
