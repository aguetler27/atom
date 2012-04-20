$ = require 'jquery'

$.fn.scrollBottom = (newValue) ->
  if newValue?
    @scrollTop(newValue - @height())
  else
    @scrollTop() + @height()

$.fn.scrollRight = (newValue) ->
  if newValue?
    @scrollLeft(newValue - @width())
  else
    @scrollLeft() + @width()

$.fn.containsElement = (element) ->
  (element[0].compareDocumentPosition(this[0]) & 8) == 8

$.fn.preempt = (eventName, handler) ->
  @on eventName, (e, args...) ->
    if handler(e, args...) == false then e.stopImmediatePropagation()

  eventNameWithoutNamespace = eventName.split('.')[0]
  handlers = @data('events')[eventNameWithoutNamespace]
  handlers.unshift(handlers.pop())
