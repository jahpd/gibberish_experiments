# freenode.net#labmacambira 2014-02-12 16-29:00 UTC:
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
#  > yay! FORK ME IN https://www.github.com/jahpd/gibberish_experiments
#  > Creative Commons cc-by-sa 3.0
#  > email to: yaknowboutblogmusic@riseup.net
RAILS.INIT 1000, ->
  sine = RAILS.GEN_RAND "Sine", 
    amp: [0.25, 0.71]
    freq: [100, 1000]
  
  pwm = RAILS.GEN_RAND "PWM",
    amp: [0.25, 0.71]
    freq: [100, 1000]
    pulsewidth: [0.1, 0.9]
    
  noise = RAILS.GEN "Noise", 
    amp: Add sine, pwm
  
  buffer = RAILS.GEN_RAND "BufferShuffler",
    input: Mul noise, pwm
    chance: [.45, 0.75]
    amount: [44, 4410]
    rate:44100
    pitchMin:[-12, -1]
    pitchMax:[1, 12]
    
  svf =  RAILS.GEN_RAND "SVF", 
    input: Mul buffer, sine
    cutoff: [200, 800]
    Q: [0.1, 7]
    mode:[0,3]
 
  reverb = RAILS.GEN_RAND "Reverb",
    input: Mul svf, buffer
    roomSize: [0.7, 1]
    wet:[0.7, 1]
    dry:[0.1, 0.5]
    
  reverb.connect()
  
