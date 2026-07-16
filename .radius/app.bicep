extension radius

param environment string

@secure()
param databasePassword string

resource finosTraderXApp 'Radius.Core/applications@2025-08-01-preview' = {
  name: 'finos-trader-x'
  properties: {
    environment: environment
  }
}

resource databaseImage 'Radius.Compute/containerImages@2025-08-01-preview' = {
  name: 'database-image'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'database/Dockerfile.compose#L1'
    tag: '8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
    build: {
      source: 'git::https://github.com/willdavsmith/finos-traderX.git//database?ref=8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
      dockerfile: 'Dockerfile.compose'
      platforms: [
        'linux/amd64'
      ]
    }
  }
}

resource referenceDataImage 'Radius.Compute/containerImages@2025-08-01-preview' = {
  name: 'reference-data-image'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'reference-data/Dockerfile.compose#L1'
    tag: '8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
    build: {
      source: 'git::https://github.com/willdavsmith/finos-traderX.git//reference-data?ref=8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
      dockerfile: 'Dockerfile.compose'
      platforms: [
        'linux/amd64'
      ]
    }
  }
}

resource tradeFeedImage 'Radius.Compute/containerImages@2025-08-01-preview' = {
  name: 'trade-feed-image'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'trade-feed/Dockerfile.compose#L1'
    tag: '8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
    build: {
      source: 'git::https://github.com/willdavsmith/finos-traderX.git//trade-feed?ref=8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
      dockerfile: 'Dockerfile.compose'
      platforms: [
        'linux/amd64'
      ]
    }
  }
}

resource peopleServiceImage 'Radius.Compute/containerImages@2025-08-01-preview' = {
  name: 'people-service-image'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'people-service/Dockerfile.compose#L1'
    tag: '8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
    build: {
      source: 'git::https://github.com/willdavsmith/finos-traderX.git//people-service?ref=8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
      dockerfile: 'Dockerfile.compose'
      platforms: [
        'linux/amd64'
      ]
    }
  }
}

resource accountServiceImage 'Radius.Compute/containerImages@2025-08-01-preview' = {
  name: 'account-service-image'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'account-service/Dockerfile.compose#L1'
    tag: '8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
    build: {
      source: 'git::https://github.com/willdavsmith/finos-traderX.git//account-service?ref=8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
      dockerfile: 'Dockerfile.compose'
      platforms: [
        'linux/amd64'
      ]
    }
  }
}

resource positionServiceImage 'Radius.Compute/containerImages@2025-08-01-preview' = {
  name: 'position-service-image'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'position-service/Dockerfile.compose#L1'
    tag: '8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
    build: {
      source: 'git::https://github.com/willdavsmith/finos-traderX.git//position-service?ref=8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
      dockerfile: 'Dockerfile.compose'
      platforms: [
        'linux/amd64'
      ]
    }
  }
}

resource tradeProcessorImage 'Radius.Compute/containerImages@2025-08-01-preview' = {
  name: 'trade-processor-image'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'trade-processor/Dockerfile.compose#L1'
    tag: '8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
    build: {
      source: 'git::https://github.com/willdavsmith/finos-traderX.git//trade-processor?ref=8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
      dockerfile: 'Dockerfile.compose'
      platforms: [
        'linux/amd64'
      ]
    }
  }
}

resource tradeServiceImage 'Radius.Compute/containerImages@2025-08-01-preview' = {
  name: 'trade-service-image'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'trade-service/Dockerfile.compose#L1'
    tag: '8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
    build: {
      source: 'git::https://github.com/willdavsmith/finos-traderX.git//trade-service?ref=8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
      dockerfile: 'Dockerfile.compose'
      platforms: [
        'linux/amd64'
      ]
    }
  }
}

resource webFrontEndAngularImage 'Radius.Compute/containerImages@2025-08-01-preview' = {
  name: 'web-front-end-angular-image'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'web-front-end/angular/Dockerfile.compose#L2'
    tag: '8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
    build: {
      source: 'git::https://github.com/willdavsmith/finos-traderX.git//web-front-end/angular?ref=8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
      dockerfile: 'Dockerfile.compose'
      platforms: [
        'linux/amd64'
      ]
    }
  }
}

resource ingressImage 'Radius.Compute/containerImages@2025-08-01-preview' = {
  name: 'ingress-image'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'ingress/Dockerfile.compose#L1'
    tag: '8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
    build: {
      source: 'git::https://github.com/willdavsmith/finos-traderX.git//ingress?ref=8e9ef3db767a506b8eb583c13229bf0e6aaa1ac0'
      dockerfile: 'Dockerfile.compose'
      platforms: [
        'linux/amd64'
      ]
    }
  }
}

resource databaseContainer 'Radius.Compute/containers@2025-08-01-preview' = {
  name: 'database'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'database/Dockerfile.compose#L1'
    containers: {
      database: {
        image: databaseImage.properties.imageReference
        ports: {
          h2: {
            containerPort: 18082
          }
          postgres: {
            containerPort: 18083
          }
          web: {
            containerPort: 18084
          }
        }
        env: {
          DATABASE_TCP_PORT: {
            value: '18082'
          }
          DATABASE_PG_PORT: {
            value: '18083'
          }
          DATABASE_WEB_PORT: {
            value: '18084'
          }
          DATABASE_WEB_HOSTNAMES: {
            value: 'database-database'
          }
          DATABASE_DBUSER: {
            value: 'sa'
          }
          DATABASE_DBPASS: {
            value: databasePassword
          }
          DATABASE_DBNAME: {
            value: 'traderx'
          }
        }
      }
    }
  }
}

resource referenceDataContainer 'Radius.Compute/containers@2025-08-01-preview' = {
  name: 'reference-data'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'reference-data/Dockerfile.compose#L1'
    containers: {
      reference: {
        image: referenceDataImage.properties.imageReference
        ports: {
          web: {
            containerPort: 18085
          }
        }
        env: {
          REFERENCE_DATA_SERVICE_PORT: {
            value: '18085'
          }
          CORS_ALLOWED_ORIGINS: {
            value: '*'
          }
        }
      }
    }
  }
}

resource tradeFeedContainer 'Radius.Compute/containers@2025-08-01-preview' = {
  name: 'trade-feed'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'trade-feed/Dockerfile.compose#L1'
    containers: {
      feed: {
        image: tradeFeedImage.properties.imageReference
        ports: {
          web: {
            containerPort: 18086
          }
        }
        env: {
          TRADE_FEED_PORT: {
            value: '18086'
          }
          CORS_ALLOWED_ORIGINS: {
            value: '*'
          }
        }
      }
    }
  }
}

resource peopleServiceContainer 'Radius.Compute/containers@2025-08-01-preview' = {
  name: 'people-service'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'people-service/Dockerfile.compose#L1'
    containers: {
      people: {
        image: peopleServiceImage.properties.imageReference
        ports: {
          web: {
            containerPort: 18089
          }
        }
        env: {
          PEOPLE_SERVICE_PORT: {
            value: '18089'
          }
          CORS_ALLOWED_ORIGINS: {
            value: '*'
          }
        }
      }
    }
  }
}

resource accountServiceContainer 'Radius.Compute/containers@2025-08-01-preview' = {
  name: 'account-service'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'account-service/Dockerfile.compose#L1'
    containers: {
      account: {
        image: accountServiceImage.properties.imageReference
        ports: {
          web: {
            containerPort: 18088
          }
        }
        env: {
          ACCOUNT_SERVICE_PORT: {
            value: '18088'
          }
          DATABASE_TCP_HOST: {
            value: '${databaseContainer.name}-database'
          }
          DATABASE_TCP_PORT: {
            value: '18082'
          }
          DATABASE_NAME: {
            value: 'traderx'
          }
          DATABASE_DBUSER: {
            value: 'sa'
          }
          DATABASE_DBPASS: {
            value: databasePassword
          }
          PEOPLE_SERVICE_HOST: {
            value: '${peopleServiceContainer.name}-people'
          }
          CORS_ALLOWED_ORIGINS: {
            value: '*'
          }
        }
      }
    }
  }
}

resource positionServiceContainer 'Radius.Compute/containers@2025-08-01-preview' = {
  name: 'position-service'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'position-service/Dockerfile.compose#L1'
    containers: {
      position: {
        image: positionServiceImage.properties.imageReference
        ports: {
          web: {
            containerPort: 18090
          }
        }
        env: {
          POSITION_SERVICE_PORT: {
            value: '18090'
          }
          DATABASE_TCP_HOST: {
            value: '${databaseContainer.name}-database'
          }
          DATABASE_TCP_PORT: {
            value: '18082'
          }
          DATABASE_NAME: {
            value: 'traderx'
          }
          DATABASE_DBUSER: {
            value: 'sa'
          }
          DATABASE_DBPASS: {
            value: databasePassword
          }
          CORS_ALLOWED_ORIGINS: {
            value: '*'
          }
        }
      }
    }
  }
}

resource tradeProcessorContainer 'Radius.Compute/containers@2025-08-01-preview' = {
  name: 'trade-processor'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'trade-processor/Dockerfile.compose#L1'
    containers: {
      processor: {
        image: tradeProcessorImage.properties.imageReference
        ports: {
          web: {
            containerPort: 18091
          }
        }
        env: {
          TRADE_PROCESSOR_SERVICE_PORT: {
            value: '18091'
          }
          DATABASE_TCP_HOST: {
            value: '${databaseContainer.name}-database'
          }
          DATABASE_TCP_PORT: {
            value: '18082'
          }
          DATABASE_NAME: {
            value: 'traderx'
          }
          DATABASE_DBUSER: {
            value: 'sa'
          }
          DATABASE_DBPASS: {
            value: databasePassword
          }
          TRADE_FEED_HOST: {
            value: '${tradeFeedContainer.name}-feed'
          }
          CORS_ALLOWED_ORIGINS: {
            value: '*'
          }
        }
      }
    }
  }
}

resource tradeServiceContainer 'Radius.Compute/containers@2025-08-01-preview' = {
  name: 'trade-service'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'trade-service/Dockerfile.compose#L1'
    containers: {
      trade: {
        image: tradeServiceImage.properties.imageReference
        ports: {
          web: {
            containerPort: 18092
          }
        }
        env: {
          TRADING_SERVICE_PORT: {
            value: '18092'
          }
          ACCOUNT_SERVICE_HOST: {
            value: '${accountServiceContainer.name}-account'
          }
          REFERENCE_DATA_HOST: {
            value: '${referenceDataContainer.name}-reference'
          }
          PEOPLE_SERVICE_HOST: {
            value: '${peopleServiceContainer.name}-people'
          }
          TRADE_FEED_HOST: {
            value: '${tradeFeedContainer.name}-feed'
          }
          CORS_ALLOWED_ORIGINS: {
            value: '*'
          }
        }
      }
    }
  }
}

resource webFrontEndAngularContainer 'Radius.Compute/containers@2025-08-01-preview' = {
  name: 'web-front-end-angular'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'web-front-end/angular/Dockerfile.compose#L2'
    containers: {
      frontend: {
        image: webFrontEndAngularImage.properties.imageReference
        ports: {
          web: {
            containerPort: 18093
          }
        }
      }
    }
  }
}

resource ingressContainer 'Radius.Compute/containers@2025-08-01-preview' = {
  name: 'ingress'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'ingress/Dockerfile.compose#L1'
    containers: {
      ingress: {
        image: ingressImage.properties.imageReference
        ports: {
          web: {
            containerPort: 8080
          }
        }
        env: {
          NGINX_HOST: {
            value: '_'
          }
          DATABASE_URL: {
            value: 'http://${databaseContainer.name}-database:18084/'
          }
          REFERENCE_DATA_URL: {
            value: 'http://${referenceDataContainer.name}-reference:18085/'
          }
          TRADE_FEED_URL: {
            value: 'http://${tradeFeedContainer.name}-feed:18086/'
          }
          PEOPLE_SERVICE_URL: {
            value: 'http://${peopleServiceContainer.name}-people:18089/'
          }
          ACCOUNT_SERVICE_URL: {
            value: 'http://${accountServiceContainer.name}-account:18088/'
          }
          POSITION_SERVICE_URL: {
            value: 'http://${positionServiceContainer.name}-position:18090/'
          }
          TRADE_PROCESSOR_URL: {
            value: 'http://${tradeProcessorContainer.name}-processor:18091/'
          }
          TRADE_SERVICE_URL: {
            value: 'http://${tradeServiceContainer.name}-trade:18092/'
          }
          WEB_FRONTEND_URL: {
            value: 'http://${webFrontEndAngularContainer.name}-frontend:18093/'
          }
        }
      }
    }
  }
}

resource ingressRoute 'Radius.Compute/routes@2025-08-01-preview' = {
  name: 'ingress-route'
  properties: {
    environment: environment
    application: finosTraderXApp.id
    codeReference: 'ingress/nginx.traderx.conf.template#L1'
    kind: 'HTTP'
    rules: [
      {
        matches: [
          {
            httpPath: '/'
          }
        ]
        destinationContainer: {
          resourceId: ingressContainer.id
          containerName: 'ingress'
          containerPort: 8080
        }
      }
    ]
  }
}
