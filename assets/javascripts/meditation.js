(function() {
  RAILS.INIT(function() {
    var buffer, i, karplus, rev, rev2, _i, _ref, _ref1, _results;
    karplus = RAILS.GEN_RANGE("KarplusStrong", {
      blend: [0.1, 0.99],
      damping: [0.1, 0.99]
    });
    buffer = new Gibberish.BufferShuffler({
      input: karplus,
      chance: .45,
      amount: 125,
      rate: 44100,
      pitchMin: -4,
      pitchMax: 4
    });
    rev = new Gibberish.Reverb({
      input: buffer,
      roomSize: RAILS.GEN_RANGE("Sine", {
        freq: [0.001, 1],
        amp: [0.9, 1],
        pulsewidth: [0.1, 0.9]
      }),
      wet: RAILS.GEN_RANGE("Sine", {
        freq: [0.5, 1.5],
        amp: [0.9, 1]
      }),
      dry: RAILS.GEN_RANGE("Triangle", {
        freq: [0.5, 1.5],
        amp: [0.9, 1]
      })
    });
    rev2 = new Gibberish.Reverb({
      input: rev,
      roomSize: 0.75,
      wet: 0.75,
      dry: .5
    });
    rev2.connect();
    return RAILS.GEN_SEQ({
      target: karplus,
      keysAndValues: {
        note: [256, 512, 1024, 2048, 4096, 8192, 16384, 2048, 4096, 8192, 16384, 512, 1024, 2048, 8192, 16384, 512, 1024, 2048, 256, 512, 1024, 512, 1024, 256, 512, 1024, 16384, 512, 1024, 2048, 8192, 16384, 512, 1024, 2048, 256, 512, 1024],
        amp: (function() {
          var _i, _len, _ref, _results;
          _ref = [16384, 16384, 16384, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 1024, 1024];
          _results = [];
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            i = _ref[_i];
            _results.push(i / 16384);
          }
          return _results;
        })()
      },
      durations: (function() {
        _results = [];
        for (var _i = _ref = ms(1000), _ref1 = ms(30); _ref <= _ref1 ? _i <= _ref1 : _i >= _ref1; _ref <= _ref1 ? _i++ : _i--){ _results.push(_i); }
        return _results;
      }).apply(this)
    }).start();
  });

}).call(this);
