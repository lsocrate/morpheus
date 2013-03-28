'use strict'
Mortal = require('../../lib/models/mortal.coffee')

exports.test =
  setUp: (done) ->
    done()

  'Create mortal': (test) ->
    mortal = new Mortal('John Doe')
    test.equal(mortal.name, 'John Doe')
    test.done()

  'Get health': (test) ->
    mortal = new Mortal('John Doe')
    test.equal(6, mortal.health())
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
    mortal = new Mortal('John Doe')
    test.equal(2, mortal.willpower.dots)
    test.equal(2, mortal.willpower.points)
    test.done()
