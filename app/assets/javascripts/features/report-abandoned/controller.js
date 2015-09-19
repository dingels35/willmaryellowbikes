(function() {
    'use strict';

    angular.module('wyb.features').controller ('ReportAbandonedCtrl', ReportAbandonedCtrl);
    ReportAbandonedCtrl.$inject = [];

    function ReportAbandonedCtrl() {
      var vm = this;
      vm.form = {
        location: '',
        locationDescription: '',
        bikeNumber: ''
      };
      vm.locationOptions: ['My location', 'Somewhere else'];

    }


})();
