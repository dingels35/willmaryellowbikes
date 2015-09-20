(function() {
    'use strict';

    angular.module('wyb.features').directive('checkInOut', CheckInOut);

    function CheckInOut() {
      return {
        restrict: 'E',
        templateUrl: '/assets/features/check-in-out/index.html',
        controller: 'CheckInOutCtrl',
        controllerAs: 'vm'
      };
    }


})();
