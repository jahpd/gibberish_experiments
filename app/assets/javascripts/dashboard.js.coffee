# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/rail
if Gibberish.initialized
    Gibberish.clear()
    
Gibberish.init()
Gibberish.Time.export()
Gibberish.Binops.export()
  
rnoisea = Gibberish.rndf(0.001, Math.sqrt(0.5))
noise = new Gibberish.Noise(rnoisea)
  
rsinef = Gibberish.rndf(110, 1880)
rsinea = Gibberish.rndf(0.01, 1.01)
sine_noise = Mul(rsinea, noise)
sine =  new Gibberish.Sine(rsinef, sine_noise)

rpwmf = Gibberish.rndf(110, 1880)
rpwma = Gibberish.rndf(0.01, 1.01)
rpwmw = Gibberish.rndf(0.01, 1.01)
sine_pwm = Mul(sine, rpwmw)
pwm = new Gibberish.PWM(rpwmf, 0.71, sine_pwm)
  
d_c = Gibberish.rndf(400, 1000)
d_cutoff = Mul(d_c, pwm)

d_qq = Gibberish.rndf(0.01, 1)
d_q = Mul(d_qq, pwm)
svf = new Gibberish.SVF {
  input:noise
  cutoff:d_cutoff 
  Q:d_q
  mode:2
}

Mul(svf, 0.71).connect()