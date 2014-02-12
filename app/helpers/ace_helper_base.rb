module AceHelper
  module Base
    
    attr_accessor :method, :lang
    
    def id(method, lang)
      "#{method}_#{lang}-editor"
    end
    
    def base_ace(src, theme)
      _src = "editor = ace.edit('#{id(@method, @lang)}');\n"
      _src << "editor.setTheme('ace/theme/#{theme}');\n"
      _src << "editor.getSession().setMode('ace/mode/#{@lang}');\n"
      _src << "editor.setValue '#{src}'\n"
    end
    
    def hook_ace_to_textarea(method)
      src = ""
      src << "textarea = document.getElementById 'lib_#{method}'\n"
      src << "editor.getSession().on 'change', (e) -> textarea.innerHTML = editor.getValue()"
    end
    
    def style_ace(options={:position => :absolute, :top => "0", :left => "0", :right => "0", :bottom => "0"})
      src = ""
      options.each{|k, v| 
        unless k == :wrap and k == :lang
          src <<  "#{k}: #{v};"
        end
      } 
      src
    end
  end
end