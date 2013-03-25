'use strict'

Morpheus_Manager = require('../lib/Morpheus-Manager.coffee')

exports['awesome'] =
  setUp: (done) ->
    done()
  'no args': (test) ->
    test.expect(1)
    test.equal(Morpheus_Manager.awesome(), 'awesome', 'should be awesome.')
    test.done()
