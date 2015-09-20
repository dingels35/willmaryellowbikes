(function() {
    'use strict';

    angular.module('wyb.features').directive('reportBroken', ReportBroken);

    function ReportBroken() {
      return {
        restrict: 'E',
        templateUrl: '/assets/features/report-broken/index.html',
        controller: 'ReportBrokenCtrl',
        controllerAs: 'vm'
      };
    }


})();
