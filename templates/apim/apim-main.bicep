param apimName string
param apiName string
param apiDisplayName string
param apiDescription string
param apiServiceUrl string


//module for test-api-main.bicep
module testAPIModule './apim/apim-api-main.bicep' = {
  name: 'rg-deploy-apim-test-api'
  params: {
    apimName: apimName
    apimAPIName: apiName    
    apimDisplayName: apiDisplayName    
    apimDescription: apiDescription
    apimServiceUrl: apiServiceUrl

  }
}

