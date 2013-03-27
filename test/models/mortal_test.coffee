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
    mortal.assignDamage(3, 'b')
    test.equal(3, mortal.damage.bashing)

    mortal = new Mortal('John Doe')
    mortal.assignDamage(3, 'l')
    test.equal(3, mortal.damage.lethal)


    test.done()
