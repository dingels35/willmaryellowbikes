(function() {
    'use strict';

    angular.module('wyb.features').controller ('ReportBrokenCtrl', ReportBrokenCtrl);
    ReportBrokenCtrl.$inject = [];

    function ReportBrokenCtrl() {
      var vm = this;
      vm.form = {
        location: '',
        locationDescription: '',
        bikeNumber: '',
        problemDescription: ''
      };
      vm.locationOptions = ['My location', 'Somewhere else'];

    }


})();
