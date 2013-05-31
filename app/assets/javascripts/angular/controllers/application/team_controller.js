App.controller('TeamController', ['$scope', '$http', '$location', '$routeParams', function($scope, $http, $location, $routeParams){
  $scope.team = [];

  $scope.showTeam = (function(){
    var id = $routeParams.id;
    $http.get('/api/teams/' + id).success(function(data){
      $scope.team = data.team;
    });
  }).call(this);
}]);
