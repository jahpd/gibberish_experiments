(function() {
  window.init = function() {
    Gibberish.init();
    Gibberish.Time["export"]();
    Gibberish.Binops["export"]();
    return console.log("Gibberish initialized");
  };

  window.clear = function() {
    Gibberish.clear();
    return console.log("Gibberish cleared");
  };

  window.osc = function(name, opt, callback) {
    var k, t, v, _i, _len;
    t = new Gibberish[name]();
    for (v = _i = 0, _len = opt.length; _i < _len; v = ++_i) {
      k = opt[v];
      t[k] = v;
    }
    return callback(t);
  };

}).call(this);
