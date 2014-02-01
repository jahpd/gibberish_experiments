module Gibberish
  
  module Helpers
    
    VERSION = "0.0.1.1"
    GIBBERISH_SCRIPTS_FOLDER = "./public/scripts/gibberish/*/*.gb"
    
    attr_accessor :title, :menu, :footer, :scripts
    
    public
    
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
      array = Array.new
      Dir.glob(GIBBERISH_SCRIPTS_FOLDER){|file|
        f = (file.split "/")[5]
        f = (f.split ".gb")[0]
        if f == query
          puts file
          i = 0
          File.foreach(file){|line| array[i] = line; i += 1}
        end
      }
      array
    end
  end
end