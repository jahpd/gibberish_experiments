(function() {
  window.init = function() {
    Gibberish.init();
    Gibberish.Time["export"]();
    Gibberish.Binops["export"]();
    return console.log("Gibberish initialized");
  };

  window.sine = function(freq, amp, callback) {
    return callback(new Gibberish.Sine(freq, amp));
  };

  window.saw = function(freq, amp, callback) {
    return callback(new Gibberish.Saw(freq, amp));
  };

  window.clear = function() {
    Gibberish.clear();
    return console.log("Gibberish cleared");
  };

}).call(this);
