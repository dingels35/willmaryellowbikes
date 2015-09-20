(function() {
  'use strict';

  angular.module('wyb.services').factory('BaseService', BaseService);
  BaseService.inject = ['$http', '$q', 'promiseCache'];

  function BaseService($http, $q, promiseCache) {
    var svc = {
      get: get,
      post: post,

    };
    return svc;

    /////////////////

    function get(endpoint, data, opts) {
      if (opts == null) {
        opts = {};
      }
      var ttl = opts.ttl || 30000;
      var force = opts.force || false;
      return promiseCache({
        promise: function() {
          return xhr(endpoint, data, 'GET');
        },
        ttl: ttl,
        key: endpoint + JSON.stringify(data),
        bustCache: force,
        expireOnFailure: function() {
          return true;
        }
      });
    }

    function post(endpoint, data) {
      return xhr(endpoint, data, 'POST');
    }

    function url(endpoint) {
      return "/api/" + endpoint;
    }

    function xhr(endpoint, data, method) {
      var headers, params;
      headers = {
        'Content-Type': 'application/json'
      };
      params = {};
      if (data && method === "GET") {
        angular.extend(params, data);
        data = "";
      }
      return $http({
        method: method,
        url: url(endpoint),
        data: data,
        params: params,
        headers: headers
      });
    }

  }


})();
