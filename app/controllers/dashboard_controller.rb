class DashboardController < ApplicationController
  def index
    write Lib.all, "vendor/assets/javascripts/app_audio_lib.js", true
    @title = "Gibberish Experiments"
    @subtitle = "An aplication to Blog-Music"
    @menu = {
      "libs" => "/libs",
      "how to" => "/helps",
      "live-coding" => "/play"
    }
    @little_text= "Ya'now'bout blog-music, Why The Luck Stiffer?"
    @messages= [
      "------------------------------------------------------------W------------------------------------------------------------",
      "(try refresh your browser)",
      "...sometimes, your are unnable to hear (or see) some things...",
      "?ya wannabe careful with volume?",
      "------------------------------------------------------------AA------------------------------------------------------------"
    ]
    @footer = {"license:" => "Creative Commons cc-by-sa 3.0", "email to:" => "yaknowboutblogmusic@gmail.com"}
  end
  
  
  def play
    @helper = PlayHelper::Ace.new
    @src = "init (e) ->\nif not e\n\t# type your code here"
  end
  
  private
  
    def genLibDict(libs, debug=false)
      dict = Hash.new
      libs.each do |lib|
        if not dict[lib.author]
          dict[lib.author]= Hash.new
          dict[lib.author][:head] = "window.#{lib.author} = {}\n\n"
          dict[lib.author][:codes] = Hash.new
        end
        dict[lib.author][:codes][lib.name] = "window.#{lib.author}.#{lib.name} = #{lib.code}\n\n"
      end
      if debug 
        logger.info { dict }
      end
      dict  
    end
    
    def genLibString(libs, s, debug=false)
      genLibDict(libs, debug).each do |key, val|
        s << val[:head]
        val[:codes].each do |k, v|
          s << v
        end
      end
      if debug
        logger.info { s }
      end
      s
    end
    
    def write(libs, path, debug)
      if libs.length > 0
        string = genLibString(libs, "", debug)
        compiled = CoffeeScript.compile string
        if compiled.length >  0 then logger.warn { "writed new javascript #{path}" } end
        File.write path, compiled
      end
    end
end