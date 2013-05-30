var App = angular.module('App', ['ngResource'])

App.config(['$routeProvider', function($routeProvider){
  $routeProvider.when('/round', {
    templateUrl: 'angular/round/index.html'
  });
}]);
