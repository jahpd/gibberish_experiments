(function() {
  window.RAILS = {};

  window.RAILS.INIT = function(callback) {
    if (Gibberish.initialized) {
      Gibberish.clear();
    }
    Gibberish.init();
    Gibberish.Time["export"]();
    Gibberish.Binops["export"]();
    return callback();
  };

  window.RAILS.GEN = function(name, opt, c) {
    var k, ugen, v, _i, _len;
    ugen = new Gibberish[name];
    for (v = _i = 0, _len = opt.length; _i < _len; v = ++_i) {
      k = opt[v];
      ugen[k] = v;
    }
    if (c) {
      c(ugen);
    }
    return ugen;
  };

  window.RAILS.RANGE = function(range, callback) {
    var r;
    r = Gibberish.rndf(range[0], range[range.length - 1]);
    if (callback) {
      callback(r);
    }
    return r;
  };

  window.RAILS.GEN_RANGE = function(n, o, c) {
    var k, u, v, _i, _len;
    for (v = _i = 0, _len = o.length; _i < _len; v = ++_i) {
      k = o[v];
      o[k] = RAILS.RANGE(v);
    }
    u = RAILS.GEN(n, o);
    if (c) {
      c(u);
    }
    return u;
  };

  window.RAILS.OP_MUL = Gibberish.Binops.Mul;

  window.RAILS.GEN_SEQ = function(opt) {
    return new Gibberish.Sequencer(opt);
  };

  window.RAILS.OP_ADD = Gibberish.Binops.Add;

}).call(this);
