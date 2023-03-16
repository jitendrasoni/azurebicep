
param apimName string
param apiName string
param operationName string
param operationDisplayName string

@description('HTTP Verb')
@allowed([
  'GET'
  'POST'
])
param method string 

param frontendUrl string

// Get existing apim instance note: use 'existing' keyword
resource apim 'Microsoft.ApiManagement/service@2021-12-01-preview' existing = {
  name: apimName
}

resource api 'Microsoft.ApiManagement/service/apis@2021-12-01-preview' existing = {
  name: apiName
  parent: apim
}

// Add operation
resource operation 'Microsoft.ApiManagement/service/apis/operations@2021-12-01-preview' = {
  name: operationName
  parent: api
  properties: {
    description: operationDisplayName
    displayName: operationDisplayName
    method: method
    urlTemplate: frontendUrl
  }
}
