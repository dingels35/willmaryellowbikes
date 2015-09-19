'use strict'

angular.module 'wyb.config', ['ui.router']

.config ['$stateProvider', '$urlRouterProvider', '$locationProvider', ($stateProvider, $urlRouterProvider, $locationProvider) ->
  if window.history && history.pushState
    $locationProvider.html5Mode
      enabled: true,
      requireBase: true
  else
    $locationProvider.hashPrefix('!')

  # base controller for states.  just need to pass params to the view
  # ParamsCtrl = ($stateParams, $scope) ->
  #   $scope.params = $stateParams
  #   return
  # angular.module('wyb.config').controller('ParamsCtrl', ParamsCtrl)
  # ParamsCtrl.$inject = ['$stateParams', '$scope']


  addState = (name, url, options) ->
    options.folder ||= ''
    $stateProvider.state \
      name,
      angular.extend {
        url: url
        templateUrl: "/assets/pages/#{options.folder}#{name}.html"
        # controller: options.controller || ParamsCtrl
      }, options
    return



  # accessible to everybody
  options = { auth: { anonymous: true } }
  addState 'home',               '/',                  options
  addState 'abandoned',         '/abandoned',         options
  addState 'broken',             '/broken',            options

  $urlRouterProvider.when('', '/')
  $urlRouterProvider.otherwise '/404'

  return
]
