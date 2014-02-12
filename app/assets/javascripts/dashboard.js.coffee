# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/rail
stdlib.init () -> 
  stdlib.wnoise {amp: stdlib.random {min:0.25, max:1}}, (noise) -> 
    console.log noise.amp
    noise.connect()

