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
