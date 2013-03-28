'use strict'
lists = require('../utilities/lists.coffee')

class Merit
  constructor: (@name, @dots, @details) ->

class Mortal
  damagePriority = ['bashing', 'lethal']

  constructor: (@name) ->
    for attribute of lists.attributes
      @[attribute] = {dots: 1}
    for skill of lists.skills
      @[skill] = {dots: 0, specialties: []}

    @size = 5
    @morality = 7
    @merits = []
    @flaws = []
    @willpower =
      dots: @resolve.dots + @composure.dots
      points: @resolve.dots + @composure.dots
    @wounds =
      bashing: 0
      lethal: 0

  health: ->
    @size + @stamina.dots

  damage: (type) ->
    unless @wounds[type] >= @health()
      @wounds[type]++
    else
      nextDamageCategory = damagePriority[damagePriority.indexOf(type) + 1]
      @damage(nextDamageCategory)

  assignDamage: (damage, type) ->
    while (damage > 0)
      @damage(type.toLowerCase())
      damage--

  addMerit: (name, dots, details) ->
    @merits.push(new Merit(name, dots, details))

  getMerit: (name) ->
    @merits.filter((merit) -> merit.name is name)

module.exports = Mortal
