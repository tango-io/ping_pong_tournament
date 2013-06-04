var App = angular.module('PingPong', ['ngResource'])

App.config(['$routeProvider', function($routeProvider){
  $routeProvider.
    when('/round/final_match', {
    controller: "TemplatesController",
    templateUrl: 'api/templates/final_match'
  })
  .when('/round/:id', {
    controller: "TemplatesController",
    templateUrl: "api/templates/round"
  })
  .when('/team/:id', {
    controller: "TemplatesController",
    templateUrl: 'api/templates/team'
  })
  .when('/match/:id', {
    controller: "TemplatesController",
    templateUrl: 'api/templates/match'
  });

  $('#jTweetsAnywhereEndlessScrollingSample').jTweetsAnywhere({
    username: '#magmapong',
    searchParams: ['q=magmapong'],
    count: 2,
    showTweetFeed: {
      showProfileImages: true,
      showUserScreenNames: true,
      paging: {
        mode: 'endless-scroll'
      }
    },
    onDataRequestHandler: function(stats) {
      if (stats.dataRequestCount < 11) {
        return true;
      }
      else {
        alert("To avoid struggling with Twitter's rate limit, we stop loading data after 10 API calls.");
      }
    }
  });

  if ($('#flash_notice').size() > 0){
    $("a.btn").click()
  }
  if ($('.teams li').size()== 16){
    $('a[href^="#teamNewModal"]').remove()
    $("#teamNewModal").remove()
  }

}]);

$(document).on('ready page:load', function(){
  angular.bootstrap(document, ['PingPong']);
});
