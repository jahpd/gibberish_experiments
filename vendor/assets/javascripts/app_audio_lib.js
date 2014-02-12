(function() {
  window.stdlib = {};

  window.stdlib.init = function(callback) {
    return clear(function(e) {
      if (e) {
        Gibberish.init();
        Gibberish.Time["export"]();
        Gibberish.Binops["export"]();
        if (callback) {
          return callback(Gibberish.initialized);
        } else {
          return Gibberish.initialized;
        }
      }
    });
  };

  window.stdlib.clear = function(callback) {
    if (Gibberish.initialized) {
      Gibberish.clear();
      if (callback) {
        return callback(!Gibberish.initialized);
      } else {
        return !Gibberish.initialized;
      }
    } else {
      return console.log("Nothing to clear");
    }
  };

  window.stdlib.ugen = function(name, opt, callback) {
    var error, g, k, v, _i, _len;
    if (Gibberish[name]) {
      g = new Gibberish[name]();
      for (v = _i = 0, _len = opt.length; _i < _len; v = ++_i) {
        k = opt[v];
        g[k] = v;
      }
      if (callback) {
        return callback(false, g);
      } else {
        return g;
      }
    } else {
      error = new Error("ugen " + name + " not exist");
      if (callback) {
        return callback(true, error);
      } else {
        return error;
      }
    }
  };

  window.stdlib.wnoise = function(amp, callback) {
    return stdlib.ugen('Noise', {
      amp: amp
    }, function(e, noise) {
      if (callback) {
        return callback(noise);
      } else {
        return noise;
      }
    });
  };

  window.stdlib.sine = function(amp, callback) {
    return stdlib.ugen('Sine', {
      amp: amp
    }, function(e, sine) {
      if (callback) {
        return callback(sine);
      } else {
        return sine;
      }
    });
  };

  window.random = {};

  window.random.wnoise = function(range, callback) {
    var amp;
    if (typeof range === Array) {
      amp = Gibberish.rndf(range[0], range[range.length - 1]);
      return stdlib.wnoise(amp, function(e, noise) {
        if (callback) {
          return callback(noise);
        } else {
          return noise;
        }
      });
    }
  };

  window.random.sine = function(rfreq, ramp, callback) {
    var a, f;
    if (typeof rFreq === Array && typeof rAmp === Array) {
      f = Gibberish.rndf(rfreq[0], rfreq[rfreq.length - 1]);
      a = Gibberish.rndf(ramp[0], ramp[ramp.length - 1]);
      return stdlib.ugen('Sine', {
        freq: f,
        amp: a
      }, function(e, sine) {
        if (callback) {
          return callback(sine);
        } else {
          return sine;
        }
      });
    }
  };

  window.dashboard = {};

  window.dashboard.sine = function() {
    return random.sine([220, 880], [0.5, 0.1], function(sine) {
      return sine.connect();
    });
  };

  window.dashboard.runnning = stdlib.init(e)(function() {
    return dashboard.sine();
  });

}).call(this);
