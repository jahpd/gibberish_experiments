require "#{File.dirname(__FILE__)}/ace_helper_live"

module ApplicationHelper
  
  include AceHelper::Live
  
  VERSION = '2.0'
  
  # Include some gibberish.js version to application
  def gibberails_include_tags
    javascript_include_tag "ace", "theme-monokai", "mode-coffee", "worker-coffee", "gibberish_#{VERSION}", "app_audio_lib", "coffee-script", "data-turbolinks-track" => true
  end
  
  # Hook the gibberails controllers to ace
  # method must be :code
  # action are :lang, :wrap and :style
  # :lang => :coffee by default
  # :wrap => :div by default
  def gibberails_load(method, options)
    load_ace method, options
  end
  
  def gibberails_style(options)
    @style = options
  end
  
  def gibberails_ace(action, options)
    javascript_tag hook_ace(action, options)
  end
  
end
