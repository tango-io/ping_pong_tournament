var App = angular.module('App', ['ngResource'])

App.config(['$routeProvider', function($routeProvider){
  $routeProvider.
    when('/round/final_match', {
      templateUrl: 'angular/round/final_match.html'
    })
    .when('/round/:id', {
      templateUrl: 'angular/round/show.html'
    })
    .when('/team/:id', {
      templateUrl: 'angular/team/show.html'
    });
}]);
