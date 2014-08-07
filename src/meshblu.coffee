skynet = require 'skynet'

class Meshblu
  constructor: (uuid, token, callback=->) ->
    @connection = skynet.createConnection server: 'http://skynet.im', uuid: uuid, token: token
    @connection.on 'ready', callback

  close: =>
    @connection.close()

  onMessage: (callback=->) =>
    @connection.on 'message', callback

module.exports = Meshblu
