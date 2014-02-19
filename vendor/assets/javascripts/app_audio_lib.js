(function() {
  window.RAILS = {};

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
