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
#   - RAILS.GEN_RAND name -> calls a Ugen with random values around giben ranges
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
    blend: Add 0.9, RAILS.GEN_RAND "Triangle", amp:[0.01, 0.1], freq:[0.01, 0.1]
    damping: Add 0.9, RAILS.GEN_RAND "Triangle", amp:[0.01, 0.1], freq:[0.01, 0.1]
    
  # An FX
  # TODO switch to GEN or GEN_RANGE
  RAILS.GEN_RAND "Reverb",
    input: RAILS.GEN "Reverb",
      input: RAILS.GEN "BufferShuffler",
        input: RAILS.GEN_RAND "SVF", {input:karplus, cutoff:[200, 800], Q:[0.1, 4], mode:[0, 3]}
        chance:.45
        amount:125
        rate:44100
        pitchMin:-4
        pitchMax:4
      roomSize: Add 0.5, RAILS.GEN_RAND "Sine", amp:[0.4, 0.6], freq:[0.01, 10]
      wet: Add 0.75, RAILS.GEN_RAND "Sine", amp:[0.2, 0.3], freq:[0.01, 10]
      dry: Add 0.5, RAILS.GEN_RAND "Sine", amp:[0.4, 0.6], freq:[0.01, 10]
    roomSize: [0.5, 1]
    wet:[0.75, 0.1]
    dry:[0.25, 0.75]
  , (rev) -> rev.connect()
 
 # The sequence music
 # TODO switch arrays by functions that return an alghorimth array
  RAILS.GEN_SEQ(
    target: karplus
    keysAndValues:
      note: ->
        a = []
        a[i] = ((i+1)*110) for i in [0..9]
        a[Gibberish.rndi(0, a.length-1)] for i in [0..20]
        a
      amp: ->
        a = []
        a[i] = (((i+1)*110)/1100) for i in [0..9]
        a[Gibberish.rndi(0, a.length-1)] for i in [0..12]
        a
    durations: -> [ms(1000)..ms(30)]  
  , (seq) -> seq.start())