(function() {
  window.RAILS = {};

  window.RAILS.INIT = function(time, callback) {
    if (Gibberish.initialized) {
      Gibberish.clear();
    }
    return setTimeout(function() {
      Gibberish.init();
      Gibberish.Time["export"]();
      Gibberish.Binops["export"]();
      Gibberish.initialized = true;
      if (callback) {
        return callback();
      }
    }, time);
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

  window.RAILS.OP = function(name, callback) {
    return callback(Gibberish.Binops[name]);
  };

  window.RAILS.GEN_SEQ = function(opt) {
    return new Gibberish.Sequencer(opt);
  };

  window.RAILS.TABLE_BIN = function(opt) {
    var i, j, max, powme, raw, _i, _j, _len, _ref, _ref1, _ref2;
    raw = {};
    powme = function(n, m) {
      return Math.pow(2, Gibberish.rndi(n, m));
    };
    max = Math.pow(2, opt.matrix.j);
    raw.freq = raw.amp = [];
    for (i = _i = _ref = opt.matrix.i, _ref1 = opt.matrix.j; _ref <= _ref1 ? _i <= _ref1 : _i >= _ref1; i = _ref <= _ref1 ? ++_i : --_i) {
      raw.freq[i] = powme(i, opt.matrix.j);
    }
    _ref2 = raw.freq;
    for (_j = 0, _len = _ref2.length; _j < _len; _j++) {
      j = _ref2[_j];
      raw.amp[j] = v / max;
    }
    return raw;
  };

}).call(this);
