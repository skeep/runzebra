angular.module('zebraApp')
  .controller 'RoomCtrl', ($scope, $routeParams, $location, angularFire, fb) ->
    'use strict'
    user = localStorage['user']
    if typeof user is "undefined"
      $('#userModal').modal()
      console.log name
      $scope.user =
        name: chance.name(),
        id: fb.makeid(5)
    else
      $scope.user = JSON.parse(user)

    url = fb.url + $routeParams.roomId;
    promise = angularFire(url, $scope, 'room', {});

    promise.then ()->
      startWatch($scope)
      this

    startWatch = ($scope)->

      $scope.selectedLane = $scope.room.lanes[0];
      $scope.card = chance.sentence()

      $scope.addUser = ()->
#        console.log $scope.room.users
        $scope.room.users = []  if typeof $scope.room.users is "undefined"
        $scope.room.users.push $scope.user
        localStorage['user'] = JSON.stringify($scope.user)
        this

      $scope.addCard = (laneId)->
        $scope.room.cards = []  if typeof $scope.room.cards is "undefined"
        if $scope.card != ''
          $scope.room.cards.push
            body: $scope.card
            id: fb.makeid(5)
            lane: laneId
            user: $scope.user.id
          $scope.card = chance.sentence()
          $scope.selectedLane = $scope.room.lanes[0]
        this

      $scope.remove = (card)->
        $scope.room.cards.splice($scope.room.cards.indexOf(card), 1);

