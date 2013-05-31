App.controller('TeamController', ['$scope', '$http', '$location', '$routeParams', function($scope, $http, $location, $routeParams){
  $scope.team = [];

  $scope.showRound = (function(){
    var id = $routeParams.id;
    $http.get('/api/teams/' + id).success(function(data){
      $scope.team = data.team;
      console.log($scope.team);
    });
  }).call(this);

  $scope.showTeam = function(id){
    $location.path('team/'+id);
  };
}]);
