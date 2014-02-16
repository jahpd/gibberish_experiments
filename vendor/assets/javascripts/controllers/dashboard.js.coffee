# freenode.net#labmacambira 2014-02-12 16-29:00 UTC:
#
#  __YupanaKernel__ says to lalenia:
#  >(try refresh your browser)
#  >...sometimes, your are unnable to hear (or see) some things...
#  >?ya wannabe careful with volume?
#  >Place all the behaviors and hooks related to the matching controller here.
#  >All this logic will automatically be available
#  >You can use CoffeeScript
#
#  lalenia says to __YupanaKernel__:
#  > you said (CoffeeScript)[http://www.coffeescript.org]
#  > yay! FORK ME IN https://www.github.com/jahpd/gibberish_experiments
#  >licenses: 
#  >Creative Commons cc-by-sa 3.0
#  >email to: yaknowboutblogmusic@riseup.net
RAILS.INIT 6000, ->
  sine =  RAILS.GEN_RANGE "Sine", 
    amp: [0.01..0.71]
    freq: [1, 1000]
    
  noise = RAILS.GEN_RANGE "Noise", 
    amp: [sine.amp, 1-(1/sine.freq)]
  
  pwm = RAILS.GEN_RANGE "PWM",  
    freq: [0.1, 16]
    amp: [noise.amp, sine.amp]
    pulsewidth: [noise.amp, sine.amp]
  
  svf = new Gibberish.SVF
    input: new Gibberish.BufferShuffler
      input: RAILS.OP "Add", (op) -> op pwm, noise
      chance:.75
      amount:4410
      rate:44100
      pitchMin:-12
      pitchMax:12
    cutoff: RAILS.RANGE [100, 7000]
    Q: RAILS.OP 'Add', (op) -> op RAILS.RANGE([2, 7]), sine
    mode: RAILS.RANGE [0, 3]
   
   rev2 = new Gibberish.Reverb
    input: svf
    roomSize: RAILS.RANGE [0.1, 1]
    wet:RAILS.RANGE [0.1, 0.99]
    dry:RAILS.RANGE [0.1, 0.5]
    
   rev2.connect()
