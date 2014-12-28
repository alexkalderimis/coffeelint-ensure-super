fs = require 'fs'
should = require 'should'

CoffeeLint = require 'coffeelint'
Rule = require '../'
CoffeeLint.registerRule Rule

config =
  ensure_super:
    check:
      View: ['initialize', 'remove']

describe 'A class that does not call super where it ought to', ->

  src = fs.readFileSync __dirname + '/../test-cases/bad-class.coffee', 'utf8'

  errors = CoffeeLint.lint src, config

  it 'should report one error', ->
    errors.length.should.eql 1

  it 'should have reported the method that goes from 20-24', ->
    error = errors[0]
    should.exist error
    error.lineNumber.should.eql 20
    error.lineNumberEnd.should.eql 24

