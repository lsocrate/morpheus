'use strict'
lists = require('../utilities/lists.coffee')
camelCase = require('../utilities/tools.coffee').camelCase
Mortal = require('./mortal.coffee')

class Vampire extends Mortal
  constructor: (@name) ->
    super


module.exports = Vampire
