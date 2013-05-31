App.directive('inputdisplay', function(){
  return function(scope, element, attr){
    element.bind('click', function(){
      var target = element.next();

      if(target.attr('style').match('display: none;')){
        target.attr('style', 'display: block;');
      } else {
        target.attr('style', 'display: none;');
      }
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

  $scope.startMatch = function(id){
    console.log(id);
  };

  $scope.updateScore = function(id, score){
    console.log(id);
    console.log(score);
  };

  //$scope.toggle = function(e){
    //var elem = angular.element(e.srcElement);
    //console.log(elem);
  //}
}]);
