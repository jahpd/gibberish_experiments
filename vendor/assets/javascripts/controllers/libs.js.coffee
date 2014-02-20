# # freenode.net#labmacambira 2014-02-12 16-29:00 UTC:
#
#  __YupanaKernel__ says to lalenia:
#  >(try refresh your browser)
#  >...sometimes, your are unnable to hear (or see) some things...
#  >?ya wannabe careful with volume?or maybe security?
#  >Place all the behaviors and hooks related to the matching controller here.
#  >All this logic will automatically be available
#  >You can use CoffeeScript
#
#  lalenia says to __YupanaKernel__:
#  > you said (CoffeeScript)[http://www.coffeescript.org]
#  > yay! FORK ME IN https://www.github.com/jahpd/gibberish_experiments/tree/gibberails_design
#  > Creative Commons cc-by-sa 3.0
#  > email to: yaknowboutblogmusic@riseup.net
#
# This is a default code to help you create an audio code in Rails server
# You can use CoffeeScript in this file: http://coffeescript.org/rails
#
# Too initialize audio process in one line, call RAILS.INIT() or RAILS.INIT somenumber, -> your callback block
# RAILS.[helpers] allow you to expand Gibberish function, creating an alghoritm music
#   - RAILS.GEN name, options -> calls a Ugen
#   - RAILS.GEN_RANGE name -> calls a Ugen with random values around giben ranges
#   - RAILS.SEQ name -> generate an awesome alghoritm music sequence with generated tables
#
# For which UGENs you can use, see Gibberish documentation (https://github.com/charlieroberts/Gibberish)
#
# Ace integrated editor can two available commands:
# - Windows / Linux
#     - Stop render audio: Ctrl-.
#     - Re-Render Audio (with problems): Ctrl-Enter
# - Mac: just switch Ctrl by Command
#
# A nice feature: try hide blocks of code ;)
RAILS.INIT 1000, ->

  # Create a KarplusStrong instrument with random variables
  # Gibberish will route all audio for you
  karplus = RAILS.GEN "KarplusStrong", 
    blend: Add 0.95, RAILS.GEN_RAND("Triangle", amp:0.05, freq:[0.1, 2])
    damping: Add 0.95, RAILS.GEN_RAND("Sine", amp:0.05, freq:[0.1, 2])
  
  buffer = RAILS.GEN_RAND "BufferShuffler",
    input: karplus
    chance:[.5, .99]
    amount:[441, 44100]
    rate:44100
    pitchMin:[-12, -0.1]
    pitchMax:[0.1, 12]
  
  rev = RAILS.GEN_RAND "Reverb", 
    input: buffer
    roomSize: [0.1, 1]
    wet:[0.75, 0.9]
    dry:[0.5, 0.75]
 
  rev.connect()
  
  RAILS.GEN_SEQ 
    target: karplus
    durations: ->
      min = Gibberish.rndi(30, 500)
      max = Gibberish.rndi(970, 1100)
      [ms(min)..ms(max)]
    keysAndValues:
      note: ->
        a = []
        a[i] = Math.pow(2, i+8) for i in [0..7]
        a[Gibberish.rndi(0, a.length-1)] for i in [0..21]
      amp: ->
        a = []
        a[i] = Math.pow(2, i+8) for i in [0..7]
        a[Gibberish.rndi(0, a.length-1)]/16384 for i in [0..13]
   , (seq) -> seq.start()
    