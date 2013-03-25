'use strict'
lists = require('../utilities/lists.coffee')

class Mortal
  constructor: (@name) ->
    for attribute of lists.attributes
      @[attribute] = {dots: 1}
    for skill of lists.skills
      @[skill] = {dots: 0, specialties: []}

    @size = 5
    @morality = 7
    @merits = []
    @flaws = []
    @health = {dots: 0}
    @willpower = {dots: 0, points: 0}

module.exports = Mortal
