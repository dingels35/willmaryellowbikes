(function() {
  'use strict';
  angular.module('wyb.config', ['ui.router']).config([
    '$stateProvider', '$urlRouterProvider', '$locationProvider', function($stateProvider, $urlRouterProvider, $locationProvider) {
      var addState, options;
      if (window.history && history.pushState) {
        $locationProvider.html5Mode({
          enabled: true,
          requireBase: true
        });
      } else {
        $locationProvider.hashPrefix('!');
      }
      addState = function(name, url, options) {
        options.folder || (options.folder = '');
        $stateProvider.state(name, angular.extend({
          url: url,
          templateUrl: "/assets/pages/" + options.folder + name + ".html"
        }, options));
      };
      options = {
        auth: {
          anonymous: true
        }
      };
      addState('home', '/', options);
      addState('abandoned', '/abandoned', options);
      addState('broken', '/broken', options);
      $urlRouterProvider.when('', '/');
      $urlRouterProvider.otherwise('/404');
    }
  ]);

}).call(this);
