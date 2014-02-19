module AceHelper
  
  module Base
    
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::JavaScriptHelper
    
    def load_ace(method, action, options)
      @method = method
      @lang = options[:lang]
      @action = action
    end
  
    def hook_ace_gibber(options)
      src = "#{active_script(:RAILS)}\n"
      src << "RAILS.editor = editor = ace.edit '#{@method}_#{@lang}_editor'\n"
      src << "editor.setTheme 'ace/theme/#{options[:theme]}'\n"
      src << "editor.getSession().setMode 'ace/mode/#{@lang}'\n"
      src << "editor.setValue('#{escape_javascript(active_script(@action))}')\n"
      src << "console.log 'Ace editor loaded!'\n"
      options[:commands].each{|k, v|
        src << "editor.commands.addCommand \n"
        src << "  name: '#{k}_#{@method}_#{@action}'\n"
        v.each_pair{|kk, vv| 
          src << "  #{kk}: #{vv}\n" 
        }
        src << "  readOnly: true\n"
      }
      src << "return RAILS.run()"
      CoffeeScript.compile(src)
    end
  
    protected
      
      VENDOR = "../../vendor"
      JAVASCRIPTS = "assets/javascripts/controllers/"
      FOLDER = "#{File.dirname(__FILE__)}/#{VENDOR}/#{JAVASCRIPTS}"

      def active_script(action)
        src = ""
        File.foreach("#{FOLDER}/#{action}.js.coffee") { |line| src << line }
        src
      end
      
      def style_params_ace(options)
        s = ""
        options.each_pair{|k, v| s << "#{k}: #{v};"}
        s
      end
  end
end