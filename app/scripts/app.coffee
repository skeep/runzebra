"use strict"
angular.module("zebraApp", ['firebase']).config ($routeProvider) ->
  $routeProvider.when("/",
    templateUrl: "views/main.html"
    controller: "MainCtrl"
  ).when('/room/:roomId',
    templateUrl: 'views/room.html',
    controller: 'RoomCtrl'
  ).when('/room/:roomId/manage/:roomSecret',
    templateUrl: 'views/roomManager.html',
    controller: 'RoommanagerCtrl'
  ).otherwise redirectTo: "/"

angular.module('zebraApp')
  .controller 'AppCtrl', (angularFire) ->
