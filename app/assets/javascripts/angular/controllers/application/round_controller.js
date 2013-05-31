App.controller('RoundController', ['$scope', '$http', '$location', '$routeParams', function($scope, $http, $location, $routeParams){
  $scope.matches = [];

  $scope.showRound = (function(){
    var id = $routeParams.id;
    $http.get('/api/round/' + id).success(function(data){
      angular.forEach(data, function(m, index){
        m.match.pair = index%2 === 0 ? 'gray' : 'white';
        $scope.matches.push(m.match);
      });
    });
  }).call(this);

  $scope.showTeam = function(id){
    $location.path('team/'+id);
  };
}]);
