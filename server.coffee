Meshblu = require './src/meshblu'
Device = require './src/device'
{spawn} = require 'child_process'
config  = require './meshblu.json'
debug  = require('debug')('cmdblu')

device_uuid  = config.uuid
device_token = config.token
payload_only = config.payloadOnly
meshblu_uri  = "ws://#{config.server}:#{config.port}"





meshblu = new Meshblu device_uuid, device_token, meshblu_uri, =>
  console.log 'ready'
  device = new Device meshblu
  device.onMessage (message) =>
    if payload_only
      console.log JSON.stringify(message.payload)
    else
      console.log JSON.stringify(message)

  sendMessage = ->
    message = devices: '0cce08a0-9a83-11e4-9c29-db30ae30b0dc', topic: 'refresh'
    debug 'sendMessage', message
    meshblu.connection.message message

