(function() {
  'use strict';

  angular.module('wyb.services').factory('StatusService', StatusService);
  StatusService.$inject = ['BaseService'];

    function StatusService(BaseService) {
      var svc = {
        create: create
      };
      return svc;

      ////////////////////

      function create(status) {
        return BaseService.post('statuses', status );
      }


    }

})();

