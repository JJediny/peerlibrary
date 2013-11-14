crypto = Npm.require 'crypto'

@Crypto =
  SHA256: class extends @Crypto.SHA256
    constructor: ->
      @_hash = crypto.createHash 'sha256'

    update: (data) =>
      @_hash.update data

    finalize: =>
      @_hash.digest 'hex'

if Meteor.settings.secretKey
  Crypto.SECRET_KEY = Meteor.settings.secretKey
else
  console.warn "Secret key setting missing, using public one"
  Crypto.SECRET_KEY = "whatever"