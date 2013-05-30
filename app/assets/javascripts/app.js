var App = angular.module('App', [])

App.config(['$routeProvider', function($routeProvider){
  $routeProvider.when('/round', {
    templateUrl: 'register/index.html'
  });
}]);
