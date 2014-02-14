# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/rail

RAILS.INIT ->
  sine =  RAILS.GEN_RANGE "Sine", 
    amp: [0.01..0.71]
    freq: [0.1, 16]
    
  noise = RAILS.GEN_RANGE "Noise", 
    amp: [sine.amp, 1/sine.freq]
  
  pwm = RAILS.GEN_RANGE "PWM",  
    freq: [0.1, 16]
    amp: [noise.amp, sine.amp]
    pulsewidth: [noise.amp, sine.amp]
  
  new Gibberish.SVF(
    input: new Gibberish.BufferShuffler
      input: RAILS.OP_MUL pwm, noise
      chance:.25
      amount:125
      rate:44100
      pitchMin:-4
      pitchMax:4
    cutoff: RAILS.RANGE [200, 6000]
    Q: RAILS.OP_ADD 4, sine
    mode:3
  ).connect() 
