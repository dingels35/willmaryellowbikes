(function() {
    'use strict';

    angular.module('wyb.features').directive('reportAbandoned', ReportAbandoned);

    function ReportAbandoned() {
      return {
        restrict: 'E',
        templateUrl: '/assets/features/report-abandoned/index.html',
        controller: 'ReportAbandonedCtrl',
        controllerAs: 'vm'
      };
    }


})();
