meshblu = require 'meshblu'
config  = require './meshblu.json'
debug  = require('debug')('cmdblu')

conn = meshblu.createConnection config

conn.on 'notReady', console.error

conn.on 'ready', ->
  sendMessage = ->
    message = not_a_topic: 'yo'
    debug 'sendMessage', message
    conn.message config.uuid, message, payload: 'something'
  sendMessage()

conn.on 'message', (message) ->
  console.log JSON.stringify(message, null, 2)
