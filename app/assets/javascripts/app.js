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
    })
    .when('/admin/match/:id', {
      templateUrl: 'angular/admin/match/show.html'
    })
    .when('/admin/team/:id', {
      templateUrl: 'angular/admin/team/show.html'
    })
    .when('/admin/round/final_match', {
      templateUrl: 'angular/admin/round/final_match.html'
    })
    .when('/admin/round/:id', {
      templateUrl: 'angular/admin/round/show.html'
    });
}]);
