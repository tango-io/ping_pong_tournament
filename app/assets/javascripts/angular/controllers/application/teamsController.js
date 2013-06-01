App.controller('teamController', ['$scope', function($scope){

  $scope.fillModal = function(team, players){
    $team   = $("#teamModal .teamName");
    $player = $("#teamModal .player");

    $team.text(team.name)
    $player.each(function(){
      player = players[$(this).index()];
      $(this).find(".user_account").text(player.user_account);
      if (player.type_account == 'twitter') {
      $(this).find(".user_account").attr('href', "https://www.twitter.com/"+player.user_account);
      }else {
      $(this).find(".user_account").attr('href', "https://www.github.com/"+player.user_account);
      }
      $(this).find(".email").text(player.email);
      $(this).find('.image').attr('src', player.picture_url);
    });

  };

}]);
