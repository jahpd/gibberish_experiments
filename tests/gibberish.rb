require 'test/unit'
require './helpers/gibberish'

class HelpersTest < Test::Unit::TestCase
  
  include Gibberish::Helpers
  
  attr_accessor :files
  
  def test_query
    ["base", "sine", "saw", 
     "PWM", "triangle", "White Noise", 
     "band limited saw", "karplus_strong", "table",
     "cosine", "simple_am", "ring_modulation", "allband_modulation",
        "phase_shift", "hilbert_transform", "singleband_am"].each{|e|
      array = queryGibberish(e)
      assert_instance_of(Array, array)
      assert_equal(true, array.length>0)
    }
  end
end