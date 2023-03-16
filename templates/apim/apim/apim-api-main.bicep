param apimAPIName string
param apimName string
param apimDisplayName string
param apimDescription string
param apimServiceUrl string


resource apim 'Microsoft.ApiManagement/service@2021-12-01-preview' existing = {
  name: apimName
}

// Add WebMaps API
resource TestAPI 'Microsoft.ApiManagement/service/apis@2021-12-01-preview' = {
  name: apimAPIName
  parent: apim
  properties: {
    displayName: apimDisplayName
    description: apimDescription
    subscriptionRequired: false
    path: apimDescription
    serviceUrl: apimServiceUrl
    protocols: [
      'https'
    ]
    isCurrent: true
  } 
}



