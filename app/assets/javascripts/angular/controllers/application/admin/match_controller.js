App.directive('inputdisplay', function(){
  return function(scope, element, attr){
    element.bind('click', function(){
      var target = element.next('.score_input');
      $('.score_input').attr('style', 'display: none');
      $('.score').attr('style', 'display: block');
      element.attr('style', 'display: none;');
      target.attr('style', 'display: block;');
    })
  }
});

App.directive('inputhide', function(){
  return function(scope, element, attr){
    element.bind('click', function(){
      var target = element.parent();
      target.attr('style', 'display: none;');
      $('.score').attr('style', 'display: block');
    })
  }
});

App.controller('AdminMatchController', ['$scope', '$http', '$location', '$routeParams', function($scope, $http, $location, $routeParams){
  $scope.match_number = $routeParams.id;

  $scope.arrangeObject = function(obj){
    $scope.match = obj;
    $scope.match.sets = obj.match_sets;
  };

  $scope.showTeam = (function(){
    var id = $scope.match_number;
    $http.get('api/match/' + id).success(function(data){
      $scope.arrangeObject(data.match);
    });
  }).call(this);

  $scope.updateScore = function(id, score){
    console.log(id);
    console.log(score);
  };
}]);
