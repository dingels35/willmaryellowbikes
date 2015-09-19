(function() {
  'use strict';
  var wybApp, wybAppRun;

  wybApp = angular.module('willmaryellowbikes', ['wyb.config', 'wyb.features', 'wyb.services', 'wyb.templates']);

  wybAppRun = function() {};

  wybApp.run([wybAppRun]);

}).call(this);
