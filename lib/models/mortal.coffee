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
    @damage =
      bashing: 0
      lethal: 0

  health: -> @size + @stamina.dots

  assignDamage: (damage, type) ->
    switch type.toLowerCase()
      when 'b'
        @damage.bashing += parseInt(damage, 10)
      when 'l'
        @damage.lethal += parseInt(damage, 10)



module.exports = Mortal
