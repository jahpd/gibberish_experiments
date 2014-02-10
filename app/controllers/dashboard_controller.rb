class DashboardController < ApplicationController
  def index
    @title = "Gibberish Experiments"
    @subtitle = "An aplication to Blog-Music"
    @menu = {
      "libs" => "/libs",
      "how to" => "/helps",
      "live-coding" => "/play"
    }
    @little_text= "Ya'now'bout blog-music, Why The Luck Stiffer?"
    @message= "...try refresh your browser..."
    @footer = {"license:" => "Creative Commons cc-by-sa 3.0", "email to:" => "yaknowboutblogmusic@gmail.com"}
  end
  
  def play
    write Lib.all, "vendor/assets/javascripts/app_audio_lib.js"
  end
  
  private
  
    def write(libs, path)
      if libs.length > 0
         string = ""
        _string = ""
        libs.each{|lib|
          if _string != "window.#{lib.author} = {}\n"
            _string << "window.#{lib.author} = {}\n"
          end
          string << "window.#{lib.author}.#{lib.name} = #{lib.code}\n" 
        }
       
        src = _string << string
        compiled = CoffeeScript.compile(src)
        logger.warn { "writing new javascript #{path}:\n#{compiled}" }
        File.write path, compiled
      end
    end
end
