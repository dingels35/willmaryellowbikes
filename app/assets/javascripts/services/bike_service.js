(function() {
  'use strict';

  angular.module('wyb.services').factory('BikeService', BikeService);
  BikeService.$inject = ['BaseService'];

    function BikeService(BaseService) {
      var svc = {
        list: list,
        find: find
      };
      return svc;

      ////////////////////

      function list(data) {
        return BaseService.get('bikes', data);
      }

      function find(bikeId) {
        return BaseService.get('bikes/' + bikeId);
      }

    }

})();

