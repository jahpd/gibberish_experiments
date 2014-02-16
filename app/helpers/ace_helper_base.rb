module AceHelper
  module Base
    
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::JavaScriptHelper
    
    attr_accessor :method, :lang, :style, :hook
    
    def id(method, lang)
      "#{method}_#{lang}-editor"
    end
    
    def load_ace(method,options)
      self.method = method
      self.lang = options[:lang]
      opt = {
        :id => id(@method, @lang),
        :style => style_ace(@style)
      }
      content_tag(options[:wrap], '', opt)
    end
    
    def hook_ace(action, options)
      @hook = Array.new
      src = active_script(action)
      @hook[0] = CoffeeScript.compile base_ace(src, options[:theme])
      @hook[1] = CoffeeScript.compile hook_ace_commands(action)
      @hook.join "\n"
    end
    
    def base_ace(src, theme)
      _src = "window.editor = editor = ace.edit('#{id(@method, @lang)}');\n"
      _src << "editor.setTheme('ace/theme/#{theme}');\n"
      _src << "editor.getSession().setMode('ace/mode/#{@lang}');\n"
      _src << "editor.setValue '#{escape_javascript(src)}'\n"
      _src << "window.compile = (val) ->\n"
      _src << "  window.console.log 'RUNNING!'\n"
      _src << "  eval CoffeeScript.compile(val)\n"
    end
    
    def hook_ace_commands(action)
      _src = "editor.commands.addCommand\n"
      _src << "  name:'render_#{action}'\n"
      _src << "  bindKey: win: 'Ctrl-Enter', linux: 'Ctrl-Enter', mac: 'Command-Enter'\n"
      _src << "  exec:(e)->\n"
      _src << "    try\n"
      _src << "      compile e.getValue() \n"
      _src << "    catch e\n"
      _src << "      alert(e)\n"
      _src << "  readOnly: true\n\n"
      _src << "editor.commands.addCommand\n"
      _src << "  name:'stop_#{action}'\n"
      _src << "  bindKey: win: 'Ctrl-.', linux: 'Ctrl-.',  mac: 'Command-.'\n"
      _src << "  exec:(e)-> RAILS.INIT ->\n" #TODO verificar pq Gibberish não esta limpando tudo
      _src << "  readOnly: true\n"
      _src << "try\n"
      _src << "  compile editor.getValue()\n"
      _src << "catch e\n"
      _src << "  alert(e)\n"
    end
    
    def hook_ace_to_textarea(method)
      src = ""
      src << "textarea = document.getElementById 'lib_#{method}'\n"
      src << "editor.getSession().on 'change', (e) -> textarea.innerHTML = editor.getValue()"
    end
    
    def style_ace(options)
      src = ""
      options.each do |k, v| 
        if k == :position or k == :top or k == :bottom or k == :left or k == :right
          src <<  "#{k}: #{v};"
        end
      end
      src
    end
    
    private
      FOLDER = "#{File.dirname(__FILE__)}/../../vendor/assets/javascripts"
      FOLDER_SRC = "#{FOLDER}/controllers"
      
      def active_script(action)
        src = ""
        File.foreach("#{FOLDER_SRC}/#{action}.js.coffee") { |line| src << line }
        src
      end
  end
end