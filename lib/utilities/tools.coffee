'use strict'

camelCase = (words...) ->
  words.reduce((phrase, word) ->
    phrase + word[0].toUpperCase() + word.slice(1)
  )

module.exports.camelCase = camelCase
