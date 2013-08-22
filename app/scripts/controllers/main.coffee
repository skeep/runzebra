'use strict'

angular.module('zebraApp')
  .controller 'MainCtrl', ($scope, angularFire, $location, fb) ->

    roomId = fb.makeid(5)
    url = fb.url + roomId;
    promise = angularFire(url, $scope, roomId, {});

    promise.then ()->
      startWatch($scope)

    startWatch = ($scope)->
      $scope.createRoom = ()->
        $scope[roomId] =
          name : ''
          secret : ''
          lanes: []

        $scope[roomId].name = 'room'
        secret = fb.makeid(16)
        $scope[roomId].secret = secret

        $scope[roomId].lanes.push
          name : 'what went right'
          id : fb.makeid(5)
        $scope[roomId].lanes.push
          name : 'what should continute'
          id : fb.makeid(5)
        $scope[roomId].lanes.push
          name : 'what could improve'
          id : fb.makeid(5)

        $location.path('/room/' + roomId + '/manage/' + secret)
        this
      this

    this