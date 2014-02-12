require "#{File.dirname(__FILE__)}/ace_helper_base"

module AceHelper
  module Live
    
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::JavaScriptHelper
    
    def load(method,  options)
      self.method = method
      self.lang = options[:lang]
      content_tag(options[:wrap], '', {
        :id => id(@method, @lang),
        :style => style_ace(options)
      })
    end
 
    def run(src, options)
      _src = base_ace src, options[:theme]
      javascript_tag CoffeeScript.compile(_src)
    end
    
  end
end