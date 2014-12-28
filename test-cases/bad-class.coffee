
freeFunction = (msg) ->
  console.log msg

class View

  remove: ->
    doTheThing()

class Unrelated extends Related

  remove: ->

class BadClass extends View

  name: 'BadClass'

  foo: -> 1

  remove: (x) ->
    foo()
    x += 1

  initialize: (x) ->
    super
    w = x * x
    y = x - w
    z = "#{ z }-#{ z }"
    nested = (arg) ->
      bar arg
    return nested z

