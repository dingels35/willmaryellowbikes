(function() {
    'use strict';

    angular.module('wyb.features').controller ('AdoptRackCtrl', AdoptRackCtrl);
    AdoptRackCtrl.$inject = ['$geolocation', '$state', 'BikeRackService', 'StatusService'];

    function AdoptRackCtrl($geolocation, $state, BikeRackService, StatusService) {
      var vm = this;

      vm.bikeRacks = [];
      vm.form = {
        type: 'BikeCountStatus',
        bike_rack_id: null,
        bike_count: null
      };
      vm.isLoading = {
        location: false,
        submit: false
      }
      vm.numbers = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
      vm.submit = submit;

      init();

      // ----

      function init() {
        getLocation();
        getBikeRacks();
      }

      // ----

      function getBikeRacks() {
        BikeRackService.list().then(success, error);
        function success(response) {
          vm.bikeRacks = response.data.bike_racks;
        }
        function error(error) {
          console.log(error);
        }
      }

      function getClosestBikeRack() {
        BikeRackService.closest(vm.form.latitude, vm.form.longitude).then(success, error);
        function success(response) {
          vm.form.bike_rack_id = response.data.bike_rack.id;
          console.log(response.data);
        }
        function error(error) {
          console.log(error);
        }
      }

      function getLocation() {
        vm.isLoading.location = true;
        $geolocation.getCurrentPosition({timeout: 10000})
          .then(success, error)
          .then(fin);

        function success(position) {
          console.log(position);
          vm.form.latitude = position.coords.latitude;
          vm.form.longitude = position.coords.longitude;
          getClosestBikeRack();
        }
        function error(error) {
          removeMyLocation();
          // console.log(error);
        }
        function fin() {
          vm.isLoading.location = false;
        }
      }

      function submit() {
        if (validateForm()) {
          vm.isLoading.submit = true;
          var data = vm.form;
          if (vm.locationChoice != 'mylocation') {
            data.latitude = data.longitude = null;
          }
          StatusService.create(data).then(success, error).then(fin);
        }
        function success(response) {
          $state.transitionTo('abandoned-success');
        }
        function error(response) {
          console.log(error);
        }
        function fin() {
          vm.isLoading.submit = false;
        }
      }

      function validateForm() {
        vm.errorMessage = '';
        if (!vm.form.bike_rack_id) {
          vm.errorMessage = 'Please choose a bike rack.';
          return false;
        }
        if (!vm.form.bike_count == null) {
          vm.errorMessage = 'Please select the number of bikes.';
          return false;
        }
        return true;
      }

    }


})();
