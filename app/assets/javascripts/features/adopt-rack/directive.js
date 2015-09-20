(function() {
    'use strict';

    angular.module('wyb.features').directive('adoptRack', AdoptRack);

    function AdoptRack() {
      return {
        restrict: 'E',
        templateUrl: '/assets/features/adopt-rack/index.html',
        controller: 'AdoptRackCtrl',
        controllerAs: 'vm'
      };
    }


})();
