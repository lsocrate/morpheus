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

  @THE_INVICTUS = "The Invictus"
  @LANCEA_SANCTUM = "Lancea Sanctum"
  @ORDO_DRACUL = "The Ordo Dracul"
  @CARTHIAN_MOVEMENT = "The Carthian Movement"
  @CIRCLE_OF_THE_CRONE = "Circle of the Chrone"

  constructor: (@name) ->
    super
    @covenants = []

  setClan: (@clan) ->
    @emit('clanChange', @clan)
    @

  setCovenant: (covenant) ->
    @covenants = [covenant]
    @emit('covenantChange', @covenants)
    @

  joinCovenant: (covenant) ->
    @covenants.push(covenant)
    @emit('covenantChange', @covenants)
    @


module.exports = Vampire
