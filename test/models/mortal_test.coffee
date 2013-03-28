'use strict'
Mortal = require('../../lib/models/mortal.coffee')

module.exports =
  setUp: (done) ->
    @mortal = new Mortal('John Doe')
    done()

  'Create mortal': (test) ->
    test.equal(@mortal.name, 'John Doe')
    test.done()

  'Get health': (test) ->
    test.equal(6, @mortal.health())
    test.done()

  'Assign damage': (test) ->
    mortal = new Mortal('John Doe')
    mortal.assignDamage(3, 'bashing')
    test.equal(3, mortal.wounds.bashing)

    mortal = new Mortal('John Doe')
    mortal.assignDamage(3, 'lethal')
    test.equal(3, mortal.wounds.lethal)

    mortal = new Mortal('John Doe')
    mortal.assignDamage(3, 'bashing')
    mortal.assignDamage(3, 'lethal')
    test.equal(3, mortal.wounds.bashing)
    test.equal(3, mortal.wounds.lethal)

    mortal = new Mortal('John Doe')
    mortal.assignDamage(7, 'bashing')
    test.equal(6, mortal.wounds.bashing)
    test.equal(1, mortal.wounds.lethal)

    test.done()

  'Willpower': (test) ->
    test.equal(2, @mortal.willpower.dots)
    test.equal(2, @mortal.willpower.points)
    test.done()

  'Gain merits': (test) ->
    @mortal.addMerit('Striking Looks', 2)
    test.equal('Striking Looks', @mortal.getMerit('Striking Looks')[0].name)
    test.equal(2, @mortal.getMerit('Striking Looks')[0].dots)
    test.done()

  'Gain flaws': (test) ->
    @mortal.addFlaw('Dwarf')
    test.equal('Dwarf', @mortal.flaws[0])
    test.done()

  'Auto update willpower': (test) ->
    oldWillpower = @mortal.willpower
    @mortal.setAttribute('resolve', 3)
    newWillpower = @mortal.willpower

    test.notDeepEqual(oldWillpower, newWillpower)
    test.done()
