App.controller('TemplatesController', ['$scope', '$http', '$location', '$routeParams', function($scope, $http, $location, $routeParams){
  $scope.textTemplate = "api/templates/round";
  $scope.round_num = $routeParams.id;
}]);
