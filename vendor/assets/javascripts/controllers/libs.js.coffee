# This is a default code to help you create an audio code in Rails server
# You can use CoffeeScript in this file: http://coffeescript.org/rails
#
# Too initialize audio process in one line, call RAILS.INIT() or RAILS.INIT -> your callback block
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
RAILS.INIT 20000, ->

  # Create a KarplusStrong instrument with random variables
  # Gibberish will route all audio for you
  karplus = RAILS.GEN_RANGE "KarplusStrong", 
    blend: [0.1, 0.99]
    damping: [0.1, 0.99]
  
  # An FX
  # TODO switch to GEN or GEN_RANGE
  buffer = new Gibberish.BufferShuffler
    input: karplus
    chance:.45
    amount:125
    rate:44100
    pitchMin:-4
    pitchMax:4
  
  # An FX
  # TODO switch to GEN or GEN_RANGE
  rev = new Gibberish.Reverb
    input: buffer
    roomSize: RAILS.GEN_RANGE "Sine",
      freq: [0.001, 1]
      amp: [0.9, 1]
      pulsewidth: [0.1, 0.9]
    wet:RAILS.GEN_RANGE "Sine",
      freq: [0.5, 1.5]
      amp: [0.9, 1]
    dry:RAILS.GEN_RANGE "Triangle",
      freq: [0.5, 1.5]
      amp: [0.9, 1]
  
  # An FX
  # TODO switch to GEN or GEN_RANGE
  rev2 = new Gibberish.Reverb
    input: rev
    roomSize: 0.75
    wet:0.75
    dry:.5
 
  # Connect all to Speakers
  rev2.connect()
 
 # The sequence music
 # TODO switch arrays by functions that return an alghorimth array
  RAILS.GEN_SEQ(
    target: karplus
    keysAndValues:
      note: [
        256, 512, 1024, 2048, 4096, 8192, 16384
        2048, 4096, 8192, 16384, 512, 1024, 2048
        8192, 16384, 512, 1024, 2048,256, 512, 1024
        512, 1024, 256, 512, 1024, 
        16384, 512, 1024, 2048
        8192, 16384, 512, 1024, 2048,256, 512, 1024
      ]
      amp: i/16384 for i in [
        16384, 16384, 16384,
        256, 512, 1024, 2048, 4096, 8192, 16384
        2048, 4096, 8192, 16384, 512, 1024, 2048
        8192, 16384, 512, 1024, 2048, 256, 512, 1024
        512, 1024, 256, 512, 1024, 16384, 512, 1024, 2048
        8192, 16384, 512, 1024, 2048, 256, 512, 1024
        16384, 512, 1024, 2048, 256, 512, 1024
        512, 1024, 256, 512, 1024, 16384, 512, 
      ]
    durations:[ms(30)..ms(1000)]  
  ).start()