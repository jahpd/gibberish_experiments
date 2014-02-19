require "#{File.dirname(__FILE__)}/ace_helper_live"

module ApplicationHelper
  
  include AceHelper::Live
  
  VERSION = '2.0'
  
  # Include some gibberish.js version to application
  def gibberails_include_tags
    javascript_include_tag "gibberish_#{VERSION}", "ace", "theme-monokai", "mode-coffee", "worker-coffee", "coffee-script", "data-turbolinks-track" => true
  end
  
  # Hook the gibberails controllers to ace
  # method must be :code
  # action are :lang, :wrap and :style
  # :lang => :coffee by default
  # :wrap => :div by default
  def gibberails_load(method, action, options)
    load_ace method, action, options
    content_tag options[:wrap], "", id: "#{@method}_#{@lang}_editor", style: style_params_ace(@style)
  end
  
  def gibberails_style(options)
    @style = options
  end
  
  def gibberails_run(options)
    javascript_tag hook_ace_gibber(options)
  end
  
end
