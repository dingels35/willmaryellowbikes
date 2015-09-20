(function() {
  "use strict";

  angular.module("wyb.features").directive('wybButton', directive);


  function directive() {
    return {
      replace: true,
      scope: {
        "class": '@',
        invalid: '=',
        submitting: '=',
        submittingText: '@'
      },
      templateUrl: "/assets/features/button/index.html",
      transclude: true
    };
  }


})();
