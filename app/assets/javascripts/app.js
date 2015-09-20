(function() {
  'use strict';

  var wybApp = angular.module(
    'willmaryellowbikes',
    [
      'wyb.config',
      'wyb.features',
      'wyb.services',
      'wyb.templates',

      'angular-promise-cache',
      'ngAnimate',
      'ngMaterial',
      'ngGeolocation',
      'ui.bootstrap'
    ]);

  // wybAppRun = function() {};

  // wybApp.run([wybAppRun]);

}).call(this);
