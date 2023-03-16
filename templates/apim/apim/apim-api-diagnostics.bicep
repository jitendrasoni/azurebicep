
param apimName string
param apiName string
param appInsightsName string

resource apim 'Microsoft.ApiManagement/service@2021-12-01-preview' existing = {
  name: apimName
}

resource api 'Microsoft.ApiManagement/service/apis@2021-12-01-preview' existing = {
  name: apiName
  parent: apim
}

resource apimAppInsightsLogger 'Microsoft.ApiManagement/service/loggers@2021-12-01-preview' existing = {
  name: appInsightsName
  parent: apim
}


var bodySize = 8192
resource apiDiagnostics 'Microsoft.ApiManagement/service/apis/diagnostics@2021-12-01-preview' = {
  name: 'applicationinsights'
  parent: api
  properties: {
    alwaysLog: 'allErrors'
    httpCorrelationProtocol: 'Legacy'
    logClientIp: true
    loggerId: apimAppInsightsLogger.id
    sampling: {
      percentage: 100
      samplingType: 'fixed'
    }
    verbosity: 'information'
    backend: {
      request: {
        body: {
          bytes: bodySize
        }
        headers: []
      }
      response: {
        body: {
          bytes: bodySize
        }
        headers: []
      }
    }
    frontend: {
      request: {
        body: {
          bytes: bodySize
        }
        headers: []
      }
      response: {
        body: {
          bytes: bodySize
        }
        headers: []
      }
    }
  }
  dependsOn: [
    apimAppInsightsLogger
  ]
}
