'use strict'

angular.module('zebraApp')
  .controller 'RoommanagerCtrl', ($scope, $routeParams, angularFire, fb) ->
    url = fb.url + $routeParams.roomId;
    promise = angularFire(url, $scope, 'room', {});

    promise.then ()->
      startWatch($scope)
      this

    startWatch = ($scope)->
      path = location.origin + location.pathname
      $scope.roomManagerUrl = path + '#/room/' + $routeParams.roomId + '/manage/' + $routeParams.roomSecret
      $scope.roomUrl = path + '#/room/' + $routeParams.roomId
      $scope.createLane = ()->
        $scope.room.lanes.push({
          name: $scope.laneName
          key: fb.makeid(5)
        })

