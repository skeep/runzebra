'use strict';

angular.module('zebraApp')
  .service 'fb', () ->

    returnObj = {}
    returnObj.url = 'https://zebra.firebaseio.com/'
    returnObj.makeid = (count)->
      text = ""
      possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
      i = 0

      while i < count
        text += possible.charAt(Math.floor(Math.random() * possible.length))
        i++
      text

    returnObj