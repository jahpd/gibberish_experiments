require "#{File.dirname(__FILE__)}/ace_helper_base"
require "#{File.dirname(__FILE__)}/ace_helper_form"

module LibsHelper
  
  class Ace < ActionView::Helpers::FormBuilder
    include AceHelper::Base
    include AceHelper::Form
  end

end
