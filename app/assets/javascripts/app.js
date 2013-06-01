var App = angular.module('PingPong', ['ngResource'])

App.config(['$routeProvider', function($routeProvider){
  $routeProvider.
    when('/round/final_match', {
      controller: "TemplatesController",
      templateUrl: 'api/templates/final_match'
    })
    .when('/round/:id', {
      controller: "TemplatesController",
      templateUrl: "api/templates/round"
    })
    .when('/team/:id', {
      controller: "TemplatesController",
      templateUrl: 'api/templates/team'
    })
    .when('/match/:id', {
      controller: "TemplatesController",
      templateUrl: 'api/templates/match'
    });
}]);
