'use strict'
lists = require('../utilities/lists.coffee')
camelCase = require('../utilities/tools.coffee').camelCase
Mortal = require('./mortal.coffee')

class Vampire extends Mortal
  @DAEVA = 'Daeva'
  @GANGREL = 'Gangrel'
  @MEKHET = 'Mekhet'
  @NOSFERATU = 'Nosferatu'
  @VENTRUE = 'Ventrue'

  constructor: (@name) ->
    super

  setClan: (@clan) -> @emit('clanChange', @clan)


module.exports = Vampire
