module AceHelper
# => AceHelper Form
# Orifinal text_area, returns the following code
#
#   <label for="lib_code"></label>
#   <br></br>
#   <textarea id="lib_code" name="lib[code]">
#   ... some text code ...
#   </textarea>
#
# Form supply a mean to wrap ace in rails;
# First we neew to create a separated for, hidden it and then create a properly;
# so first create a normal form and add javascript ace; editor will generate an
# propely script
#
#   <%= f.label :code %><br>
#   <%= f.hidded_text_area %>
#   <%= f.editor :code, :coffee%>
#
# The result will be
#
#   <label for="lib_code"></label>
#   <br></br>
#   <textarea id="lib_code" name="lib[code]", class="hidden">... the properly code of lib...</textarea>
#   <div id="coffee_editor" class="ace_editor ace-monokai ace_dark">
#     <textarea class="ace_text-input" wrap="off" spellcheck="false" style="opacity: 0;"></textarea>
#     <div class="ace_gutter"></div>
#     <div class="ace_scroller" style="left: 40px; right: 0px; bottom: 0px;"></div>
#     <div style="height: auto; width: auto; top: -100px; left: -100px; visibi…en; position: fixed; overflow: visible; white-space: nowrap;"></div>
#     <div class="ace_scrollbar ace_scrollbar-v" style="display: none; width: 22px; bottom: 0px;"></div>
#     <div class="ace_scrollbar ace_scrollbar-h" style="display: none; height: 22px; left: 40px; right: 0px;"></div>
#   </div>
  module Form 
  
    include ActionView::Helpers::TagHelper
  
    def hidden_text_area(method)
      @template.text_area(:lib, method , size:"0x0")
    end
  
    def load(method,  options)
      self.method = method
      self.lang = options[:lang]
      @template.content_tag(options[:wrap], '', {
        :id => id(@method, @lang),
        :style => style_ace(options)
      })
    end

    def run(src, options)
      src = base_ace(src, options[:theme]) 
      src << hook_ace_to_textarea(@method)
      @template.javascript_tag CoffeeScript.compile src
    end
  end
end