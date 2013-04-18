'use strict'

module.exports = (grunt) ->
  grunt.initConfig(
    nodeunit:
      files: ['test/**/*_test.coffee']
    watch:
      lib:
        files: 'lib/**/*.coffee'
        tasks: ['nodeunit']
      test:
        files: 'test/**/*.coffee'
        tasks: ['nodeunit']
  )

  grunt.loadNpmTasks('grunt-contrib-nodeunit')
  grunt.loadNpmTasks('grunt-contrib-watch')

  grunt.registerTask('default', ['watch'])
  grunt.registerTask('test', ['nodeunit'])
