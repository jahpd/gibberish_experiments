# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/rails
RAILS.INIT ->
  
  karplus = RAILS.GEN_RANGE('KarplusStrong', 
    blend: [0.1, 0.99]
    damping: [0.1, 0.99]
  )
  
  # TODO why this not work?
  #RAILS.GEN('BufferShuffler'
  #  input: karplus
  #  chance:.25
  #  amount:125
  #  rate:44100
  #  pitchMin:-4
  # pitchMax:4
  #).connect()
  
  buffer = new Gibberish.BufferShuffler
    input: karplus
    chance:.25
    amount:125
    rate:44100
    pitchMin:-4
    pitchMax:4
    
  new Gibberish.Reverb(
    input: buffer
    roomSize:0.75
    wet:0.65
    dry:0.25
  ).connect()
  
  RAILS.GEN_SEQ(
    target: karplus
    keysAndValues:
      note: [
        256, 512, 1024, 2048
        2200, 1100, 880, 660
        330, 550, 1100, 2048
        880, 440, 512, 256
        2200, 1100, 880, 660
        330, 550, 440, 330
        880, 440, 512, 256
        880, 440, 512, 256
        256, 512, 1024, 2048
        330, 550, 1100, 2048
      ]
      amp: i/2200 for i in [
        256, 512, 1024, 2048
        2200, 1100, 880, 660
        330, 550, 1100, 2048
        880, 440, 512, 256
        330, 550, 1100, 2048
        330, 550, 440, 330
        2200, 1100, 880, 660
      ]
    durations:[ms(30)..ms(10000)]  
  ).start()
        
      
