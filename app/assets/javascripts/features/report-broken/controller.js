(function() {
    'use strict';

    angular.module('wyb.features').controller ('ReportBrokenCtrl', ReportBrokenCtrl);
    ReportBrokenCtrl.$inject = ['$geolocation', '$state', 'BikeService', 'BikeRackService', 'StatusService'];

    function ReportBrokenCtrl($geolocation, $state, BikeService, BikeRackService, StatusService) {
      var vm = this;

      vm.anythingElse = null
      vm.bikes = [];
      vm.bikeRacks = [];
      vm.form = {
        type: 'BrokenStatus',
        latitude: null,
        longitude: null,
        location_description: null,
        broken_description: null,
        bike_rack_id: null,
        bike_id: null,
        resolved: false
      };
      vm.isLoading = {
        location: false,
        submit: false
      }
      vm.locationChoice = null;
      vm.locationChoices = [
        { val: 'mylocation', text: 'My location' },
        { val: 'inarack', text: 'In a rack' },
        { val: 'somewhereelse', text: 'Somewhere else' }
      ]
      vm.parts = [
        { key: 'tires', value: 'Tires or wheels' },
        { key: 'chain', value: 'Chain' },
        { key: 'brakes', value: 'Brakes' },
        { key: 'seat', value: 'Seat' }
      ]
      vm.selectedParts = {}
      vm.submit = submit;

      init();

      // ----

      function init() {
        getLocation();
        getBikes();
        getBikeRacks();
      }

      // ----

      function getBikes() {
        BikeService.list().then(success, error);
        function success(response) {
          vm.bikes = response.data.bikes;
          vm.bikes.unshift({id: null, identifier: 'Unknown'});
        }
        function error(error) {
          console.log(error);
        }
      }

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
          // vm.bikeRacks = response.data.bike_racks;
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

      function removeMyLocation() {
        _.remove(vm.locationChoices, function(choice) {
          return choice.val == 'mylocation';
        });
      }

      function setBrokenDescription() {
        vm.form.broken_description = '';
        var problems = [];
        _.each(vm.selectedParts, function(val, key) {
          if(val) { problems.push("Selected: " + val); }
        });
        if (vm.anythingElse) { problems.push(vm.anythingElse); }
        vm.form.broken_description = problems.join(', ');
      }

      function submit() {
        setBrokenDescription();
        if (validateForm()) {
          vm.isLoading.submit = true;
          var data = vm.form;
          if (vm.locationChoice != 'mylocation') {
            data.latitude = data.longitude = null;
          }
          StatusService.create(data).then(success, error).then(fin);
        }
        function success(response) {
          $state.transitionTo('broken-success');
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
        if (!vm.locationChoice || (vm.locationChoice == 'somewhereelse' && !vm.form.location_description)) {
          vm.errorMessage = 'Please specify your location.';
          return false;
        }
        if (vm.locationChoice == 'inarack' && !vm.form.bike_rack_id) {
          vm.errorMessage = 'Please choose a bike rack.';
          return false;
        }
        if (!vm.form.broken_description) {
          vm.errorMessage = 'Please describe the problem.';
          return false;
        }
        return true;
      }

    }


})();
