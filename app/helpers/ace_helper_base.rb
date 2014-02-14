module AceHelper
  module Base
    
    attr_accessor :method, :lang
    
    def id(method, lang)
      "#{method}_#{lang}-editor"
    end
    
    def base_ace(src, theme)
      _src = "window.editor = editor = ace.edit('#{id(@method, @lang)}');\n"
      _src << "editor.setTheme('ace/theme/#{theme}');\n"
      _src << "editor.getSession().setMode('ace/mode/#{@lang}');\n"
      _src << "editor.setValue '#{src}'\n"
    end
    
    def hook_ace(action)
      _src = "window.editor.commands.addCommand\n"
      _src << "  name:'#{action}'\n"
      _src << "  bindKey: win: 'Ctrl-M',  mac: 'Command-M'\n"
      _src << "  exec:(e)->\n"
      _src << "    try\n"
      _src << "      eval(CoffeeScript.compile(e.getValue()))\n"
      _src << "    catch e\n"
      _src << "      $('body').html('<div>'+e+'</div>')\n"
      _src << "  readOnly: true\n\n"
      _src << "window.editor.commands.addCommand\n"
      _src << "  name:'stop_#{action}'\n"
      _src << "  bindKey: win: 'Ctrl-.',  mac: 'Command-.'\n"
      _src << "  exec:(e)-> RAILS.INIT ->\n" #TODO verificar pq Gibberish não esta limpando tudo
      _src << "  readOnly: true"
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