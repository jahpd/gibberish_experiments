require "#{File.dirname(__FILE__)}/ace_helper_base"
require "#{File.dirname(__FILE__)}/ace_helper_live"

module PlayHelper
  
  class Ace 
    include AceHelper::Base
    include AceHelper::Live
  end
  
end
