@description('Environment to deploy')
param environment string = 'stg'

@minLength(1)
@maxLength(24)
param storageAccountName string = '${environment}workshop1bicep1we09'

param currentYear string = utcNow('yyyy')

resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = if (currentYear == '2021') {
  name: '${stg.name}/default/container11'
}

resource stg 'Microsoft.Storage/storageAccounts@2021-04-01' existing = {
  name: storageAccountName
}

output storageId string = stg.id
output blobEndpoint string = stg.properties.primaryEndpoints.blob
