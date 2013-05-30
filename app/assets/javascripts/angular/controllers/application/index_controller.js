App.controller('ApplicationIndexController', ['$scope', '$location', function($scope, $location){
  $scope.message = "Sign up team";

  $scope.navigate = function(){
    $location.path('/round');
  }
}]);

