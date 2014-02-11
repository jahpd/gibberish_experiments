(function() {
  window.stdlib = {};

  window.stdlib.init = function(callback) {
    return clear(function() {
      Gibberish.init();
      Gibberish.Time["export"]();
      Gibberish.Binops["export"]();
      if (callback) {
        return callback(Gibberish.initialized);
      } else {
        return Gibberish.initialized;
      }
    });
  };

  window.stdlib.clear = function(callback) {
    if (Gibberish.initialized) {
      Gibberish.clear();
    }
    if (callback) {
      return callback(!Gibberish.initialized);
    } else {
      return !Gibberish.initialized;
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

}).call(this);
