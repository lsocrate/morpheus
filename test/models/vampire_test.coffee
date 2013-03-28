'use strict'
Vampire = require('../../lib/models/vampire.coffee')

module.exports =
  setUp: (done) ->
    @vampire = new Vampire('John Doe')
    done()

  'Create vampire': (test) ->
    test.equal(@vampire.name, 'John Doe')
    test.done()
