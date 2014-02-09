/* Gibberish extensions*/

/* Gibberish.Cosine:
 * Similar to Gibberish.Sine, but instead use Math.sin to calculate samples
 * on table, we use a Math.cos
 */
Gibberish.Cosine = function() {
  this.__proto__ = new Gibberish.Wavetable();
  
  this.name = 'cosine';
  
  var pi_2 = Math.PI * 2, 
      table = new Float32Array(1024);
      
  for(var i = 1024; i--;) { table[i] = Math.cos( (i / 1024) * pi_2); }
  
  this.setTable( table );

  this.init( arguments );
  this.oscillatorInit();
  this.processProperties( arguments );
};

Gibberish.Binops.PhaseShift90 = function() {
  var args = Array.prototype.slice.call(arguments, 0);
  me = {
  	name : 'phase_shift',
    properties : {},
    callback : function(a) {
      var x = (-Math.pow(a, 2))+1;
      var sqrt = -Math.sqrt(x);
      return sqrt;
    }
  };
  me.__proto__ = new Gibberish.ugen();
  for(var i = 0; i < args.length; i++) {
    me.properties[i] = args[i];
  }
  me.init();
  return me;
};

Gibberish.Binops.Hilbert = function(){
  var args = Array.prototype.slice.call(arguments, 0);
  return [args[0], PhaseShift90(args[0])];
};

