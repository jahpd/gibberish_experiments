(function() {
  RAILS.INIT(function() {
    var buffer, i, karplus, pan, revL, revR, _i, _j, _ref, _ref1, _ref2, _ref3, _results, _results1;
    karplus = RAILS.GEN_RANGE("KarplusStrong", {
      blend: [0.1, 0.99],
      damping: [0.1, 0.99]
    });
    buffer = new Gibberish.BufferShuffler({
      input: karplus,
      chance: .25,
      amount: 125,
      rate: 44100,
      pitchMin: -4,
      pitchMax: 4
    });
    revL = new Gibberish.Reverb({
      input: buffer,
      roomSize: RAILS.GEN_RANGE('Sine', {
        freq: [0.001, 1],
        amp: [0.9, 1]
      }),
      wet: RAILS.GEN_RANGE('Sine', {
        freq: [0.5, 1.5],
        amp: [0.9, 1]
      }),
      dry: RAILS.GEN_RANGE('Sine', {
        freq: [0.5, 1.5],
        amp: [0.9, 1]
      })
    });
    revL = new Gibberish.Reverb({
      input: buffer,
      roomSize: RAILS.GEN_RANGE('Sine', {
        freq: [0.001, 1],
        amp: [0.9, 1]
      }),
      wet: RAILS.GEN_RANGE('Sine', {
        freq: [0.5, 1.5],
        amp: [0.9, 1]
      }),
      dry: RAILS.GEN_RANGE('Sine', {
        freq: [0.5, 1.5],
        amp: [0.9, 1]
      })
    });
    revR = new Gibberish.Reverb({
      input: buffer,
      roomSize: RAILS.GEN_RANGE('Sine', {
        freq: [0.001, 1],
        amp: [0.9, 1]
      }),
      wet: RAILS.GEN_RANGE('Sine', {
        freq: [0.5, 1.5],
        amp: [0.9, 1]
      }),
      dry: RAILS.GEN_RANGE('Sine', {
        freq: [0.5, 1.5],
        amp: [0.9, 1]
      })
    });
    pan = new Gibberish.Bus2();
    revL.connect(pan);
    revR.connect(pan);
    pan.connect();
    RAILS.GEN_SEQ({
      target: pan,
      keysAndValues: (function() {
        var _i, _len, _ref, _results;
        _ref = [256, 512, 1024, 2048, 4096, 8192, 16384, 2048, 4096, 8192, 16384, 512, 1024, 2048, 512, 1024, 2048, 512, 1024, 16384, 512, 1024, 256, 512, 1024, 2048, 4096, 8192, 16384, 2048, 4096, 8192, 16384, 512, 1024, 2048];
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          i = _ref[_i];
          _results.push({
            pan: [-(i / 16384), 1 - i / 16384]
          });
        }
        return _results;
      })(),
      durations: (function() {
        _results = [];
        for (var _i = _ref = ms(30), _ref1 = ms(10000); _ref <= _ref1 ? _i <= _ref1 : _i >= _ref1; _ref <= _ref1 ? _i++ : _i--){ _results.push(_i); }
        return _results;
      }).apply(this)
    }).start();
    return RAILS.GEN_SEQ({
      target: karplus,
      keysAndValues: {
        freq: [256, 512, 1024, 2048, 4096, 8192, 16384, 2048, 4096, 8192, 16384, 512, 1024, 2048, 256, 512, 1024, 512, 1024, 256, 512, 1024, 16384, 512, 1024, 2048, 512, 1024, 512, 1024, 512, 1024, 2048, 512, 1024, 16384, 512, 1024, 8192, 16384, 512, 1024, 2048, 256, 512, 1024, 512, 1024, 256, 512, 1024],
        amp: (function() {
          var _j, _len, _ref2, _results1;
          _ref2 = [256, 512, 1024, 2048, 4096, 8192, 16384, 2048, 4096, 8192, 16384, 512, 1024, 2048, 512, 1024, 2048, 512, 1024, 16384, 512, 1024, 256, 512, 1024, 2048, 4096, 8192, 16384, 2048, 4096, 8192, 16384, 512, 1024, 2048];
          _results1 = [];
          for (_j = 0, _len = _ref2.length; _j < _len; _j++) {
            i = _ref2[_j];
            _results1.push(i / 16384);
          }
          return _results1;
        })()
      },
      durations: (function() {
        _results1 = [];
        for (var _j = _ref2 = ms(30), _ref3 = ms(10000); _ref2 <= _ref3 ? _j <= _ref3 : _j >= _ref3; _ref2 <= _ref3 ? _j++ : _j--){ _results1.push(_j); }
        return _results1;
      }).apply(this)
    }).start();
  });

}).call(this);
