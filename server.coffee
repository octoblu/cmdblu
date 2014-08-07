Meshblu = require './src/meshblu'
Device = require './src/device'
{spawn} = require 'child_process'

device_uuid = process.env.DEVICE_UUID
device_token = process.env.DEVICE_TOKEN
payload_only = process.env.PAYLOAD_ONLY

meshblu = new Meshblu device_uuid, device_token, =>

  device = new Device meshblu
  device.onMessage (message) =>
    if payload_only
      console.log JSON.stringify(message.payload)
    else
      console.log JSON.stringify(message)
