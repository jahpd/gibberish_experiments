require 'test/unit'
require './helpers/gibberish'

class HelpersTest < Test::Unit::TestCase
  
  include Gibberish::Helpers
  
  def setup
    @opt = {
      "base" => queryGibberish("base"),
      "sine" => queryGibberish("sine")
    }
  end
  
  def test_query
    @opt.each_pair{|k, v|
      array = queryGibberish(k)
      i = 0
      array.each{|e|
        assert_equal(v[i], e)  
        i += 1
      }
    }
  end
end