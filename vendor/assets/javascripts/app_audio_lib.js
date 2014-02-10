(function() {
  window.stdlib = {};

  window.stdlib.init = function(callback) {
    Gibberish.init();
    Gibberish.Time["export"]();
    Gibberish.Binops["export"]();
    return callback(Gibberish.initialized);
  };

  window.stdlib.clear = function(callback) {
    Gibberish.clear();
    return callback(Gibberish.isDirty);
  };

  window.stdlib.ugen = function(name, opt, callback) {
    var g, k, v, _i, _len;
    if (Gibberish[name]) {
      g = new Gibberish[name]();
      for (v = _i = 0, _len = opt.length; _i < _len; v = ++_i) {
        k = opt[v];
        g[k] = v;
      }
      return callback(false, g);
    } else {
      return callback(true);
    }
  };

}).call(this);
