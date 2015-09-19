'use strict'
wybApp = angular.module 'willmaryellowbikes', [
  'wyb.config'
  'wyb.features'
  'wyb.services'
  'wyb.templates'
]

wybAppRun = () ->
  # Authorization.init()
  return

wybApp.run [wybAppRun]
