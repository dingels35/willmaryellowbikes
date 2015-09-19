'use strict'
wybApp = angular.module 'willmaryellowbikes', [
  'wyb.config'
  'wyb.features'
  'wyb.services'
]

wybAppRun = () ->
  # Authorization.init()
  return

wybApp.run [wybAppRun]
