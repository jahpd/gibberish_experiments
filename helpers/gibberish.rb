module Gibberish
  
  module Helpers
    
    VERSION = "0.0.1"
    
    attr_accessor :title, :menu, :footer, :scripts
    
    def base(hash, &block)
      hash.each_pair {|k, v|
        case k
          when :title then @title=v
          when :menu then @menu=v
          when :footer then @footer=v
          when :gibberish_base then @gibberish_base = v
          when :options then @options = v
        else
          warn "#{k} is not valid to #{self.class}"
        end 
      }
      if block_given? then yield end
    end
    
    def queryGibberish(query)
      f = "./public/scripts/#{query}.gb"
      array = []
      i = 0
      File.foreach(f){|line|
        array[i] = line
        i += 1
      }
      array
    end
  end
end