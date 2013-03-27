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
    @willpower = {dots: 0, points: 0}

  health: -> @size + @stamina.dots

module.exports = Mortal
