(function() {
  RAILS.INIT(function() {
    var noise, pwm, rev2, sine, svf;
    sine = RAILS.GEN_RANGE("Sine", {
      amp: [0.01],
      freq: [1, 1000]
    });
    noise = RAILS.GEN_RANGE("Noise", {
      amp: [sine.amp, 1 / sine.freq]
    });
    pwm = RAILS.GEN_RANGE("PWM", {
      freq: [0.1, 16],
      amp: [noise.amp, sine.amp],
      pulsewidth: [noise.amp, sine.amp]
    });
    svf = new Gibberish.SVF({
      input: new Gibberish.BufferShuffler({
        input: RAILS.OP('Add', function(op) {
          return op(pwm, noise);
        }),
        chance: .75,
        amount: 4410,
        rate: 44100,
        pitchMin: -12,
        pitchMax: 12
      }),
      cutoff: RAILS.RANGE([100, 7000]),
      Q: RAILS.OP('Add', function(op) {
        return op(RAILS.RANGE([2, 7]), sine);
      }),
      mode: RAILS.RANGE([0, 3])
    });
    rev2 = new Gibberish.Reverb({
      input: svf,
      roomSize: RAILS.RANGE([0.1, 1]),
      wet: RAILS.RANGE([0.1, 0.99]),
      dry: RAILS.RANGE([0.1, 0.5])
    });
    return rev2.connect();
  });

}).call(this);
