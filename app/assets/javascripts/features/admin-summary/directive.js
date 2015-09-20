(function() {
    'use strict';

    angular.module('wyb.features').directive('adminSummary', AdminSummary);

    function AdminSummary() {
      return {
        restrict: 'E',
        templateUrl: '/assets/features/admin-summary/index.html',
        controller: 'AdminSummaryCtrl',
        controllerAs: 'vm'
      };
    }


})();
