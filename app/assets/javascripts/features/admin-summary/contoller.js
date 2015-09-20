(function() {
    'use strict';

    angular.module('wyb.features').controller ('AdminSummaryCtrl', AdminSummaryCtrl);
    AdminSummaryCtrl.$inject = ['BikeService'];

    function AdminSummaryCtrl(BikeService) {
      var vm = this;

      vm.bikes = [];
      vm.isLoading = false;

      init();

      // ----

      function init() {
        getBikes('abandoned');
        getBikes('broken');
      }

      // ----

     function getBikes() {
        vm.isLoading = true;
        BikeService.list({scope: 'abandoned_or_broken'}).then(success, error).then(fin);
        function success(response) {
          vm.bikes = response.data.bikes;
        }
        function error(error) {
          console.log(error);
        }
        function fin() {
          vm.isLoading = false;
        }
      }


    }


})();
