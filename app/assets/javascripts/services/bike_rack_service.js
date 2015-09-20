(function() {
  'use strict';

  angular.module('wyb.services').factory('BikeRackService', BikeRackService);
  BikeRackService.$inject = ['BaseService'];

    function BikeRackService(BaseService) {
      var svc = {
        closest: closest,
        find: find,
        list: list
      };
      return svc;

      ////////////////////

      function list() {
        return BaseService.get('bike_racks');
      }

      function find(bikeRackId) {
        return BaseService.get('bikes_racks/' + bikeId);
      }

      function closest(lat, long) {
        return BaseService.get('bike_racks/closest?lat=' + lat + '&long=' + long);
      }

    }

})();

