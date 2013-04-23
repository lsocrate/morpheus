'use strict'
lists = require('../utilities/lists.coffee')
camelCase = require('../utilities/tools.coffee').camelCase
events = require('events')
Merit = require('./merit.coffee')
Skill = require('./skill.coffee')

class Mortal extends events.EventEmitter
  damagePriority = ['bashing', 'lethal']

  constructor: (@name) ->
    for attribute of lists.attributes
      @[attribute] = {dots: 1}
    for skill of lists.skills
      @[skill] = new Skill(skill)

    @size = 5
    @morality = 7
    @merits = []
    @flaws = []
    @wounds =
      bashing: 0
      lethal: 0
    @calculateWillpower()

    @on('staminaChange', (stamina) -> console.log(stamina))
    @on('resolveChange', @calculateWillpower)
    @on('composureChange', @calculateWillpower)

  calculateWillpower: ->
    @willpower =
      dots: @resolve.dots + @composure.dots
      points: @resolve.dots + @composure.dots

  setAttribute: (attribute, value) ->
    if @[attribute]
      @[attribute].dots = Math.max(parseInt(value, 10), 1)
      @emit(camelCase(attribute, 'change'), @[attribute])

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

  addFlaw: (name) ->
    @flaws.push(name)

module.exports = Mortal
