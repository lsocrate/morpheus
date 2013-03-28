'use strict'
Vampire = require('../../lib/models/vampire.coffee')

module.exports =
  setUp: (done) ->
    @vampire = new Vampire('John Doe')
    done()

  'Create vampire': (test) ->
    test.equal(@vampire.name, 'John Doe')
    test.done()

  'Set clan': (test) ->
    @vampire.setClan(Vampire.DAEVA)
    test.equal(@vampire.clan, 'Daeva')
    test.done()
