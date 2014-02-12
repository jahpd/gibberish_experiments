(function() {
  var __slice = [].slice;

  window.stdlib = {};

  window.stdlib.init = function() {
    var callbacks, do_callbacks, export_all_and, initThen;
    callbacks = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    initThen = function() {
      return Gibberish.init();
    };
    export_all_and = function() {
      var fn, _i, _len, _ref, _results;
      _ref = "Time Binops".split(" ");
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        fn = _ref[_i];
        _results.push(Gibberish[fn]);
      }
      return _results;
    };
    do_callbacks = function() {
      var c, _i, _len, _results;
      if (callbacks.length > 0) {
        _results = [];
        for (_i = 0, _len = callbacks.length; _i < _len; _i++) {
          c = callbacks[_i];
          _results.push(c());
        }
        return _results;
      }
    };
    return stdlib.clear(initThen, export_all_and, do_callbacks);
  };

  window.stdlib.clear = function() {
    var c, callbacks, _i, _len, _results;
    callbacks = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    Gibberish.clear();
    _results = [];
    for (_i = 0, _len = callbacks.length; _i < _len; _i++) {
      c = callbacks[_i];
      if (callbacks.length > 0) {
        _results.push(c());
      }
    }
    return _results;
  };

  window.stdlib.ugen = function() {
    var c, callbacks, g, k, name, opts, v, _i, _j, _len, _len1, _results;
    name = arguments[0], opts = arguments[1], callbacks = 3 <= arguments.length ? __slice.call(arguments, 2) : [];
    g = new Gibberish[name]();
    for (v = _i = 0, _len = opts.length; _i < _len; v = ++_i) {
      k = opts[v];
      g[k] = v;
    }
    if (callbacks.length(!0)) {
      _results = [];
      for (_j = 0, _len1 = callbacks.length; _j < _len1; _j++) {
        c = callbacks[_j];
        _results.push(c(g));
      }
      return _results;
    } else {
      return g;
    }
  };

  window.stdlib.wnoise = function() {
    var amp, callbacks;
    amp = arguments[0], callbacks = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
    return stdlib.ugen("Noise", {
      amp: amp
    }, callbacks);
  };

}).call(this);
