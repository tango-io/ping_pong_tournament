App.controller('AdminRoundController', ['$scope', '$http', '$location', '$routeParams', function($scope, $http, $location, $routeParams){
  $scope.matches = [];
  $scope.round = $routeParams.id || 4;

  $scope.showRound = (function(){
    var id = $scope.round;
    $http.get('/api/round/' + id).success(function(data){
      angular.forEach(data, function(m, index){
        m.match.pair = index%2 === 0 ? 'gray' : 'white';
        m.match.empty = m.match.teams.length === 0 ? true : false;
        m.match.winner = m.match.champion === null ? true : false;
        $scope.matches.push(m.match);
      });
    });
  }).call(this);

  $scope.showTeam = function(id){
    $location.path('/admin/match/'+id);
  };

  $scope.nextMatch = function(id){
    var next_id = parseInt(id) + 1;
    if(next_id < 4){
      $location.path('admin/round/'+next_id);
    } else {
      $location.path('admin/round/final_match');
    }
  };

  $scope.previousMatch = function(id){
    var next_id = parseInt(id) - 1;
    if(next_id > 0){
      $location.path('admin/round/'+next_id);
    }
  };
}]);
