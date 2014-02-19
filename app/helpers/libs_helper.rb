require "#{File.dirname(__FILE__)}/ace_helper_base"
require "#{File.dirname(__FILE__)}/ace_helper_form"

module LibsHelper
  
  class Ace < ActionView::Helpers::FormBuilder
    
    include AceHelper::Base
    
    def hidden_text_area(method)
      @template.text_area(:lib, method , size:"0x0")
    end
  
    def load_ace(method, action, options)
      load_ace(method, action, options)
      @template.content_tag(options[:wrap], '', {
        :id => "#{@method}_#{@action}_#{@lang}_editor",
        :style => style_params_ace(@style)
      })
    end

    def gibberails_run(options)
      @template.javascript_tag hook_ace_gibber(options)
    end
    
  end
end