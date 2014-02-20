require 'time'

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
    @tested_on={
      :windows =>{
        :firefox=>['27.0'],
        :os=>["XP SPack:2"]
      }
    }
    @time = Time.now.httpdate
    @render = {
      :bindKeys => "win: 'Ctrl-Enter', linux: 'Ctrl-Enter', mac: 'Command-Enter'",
      :exec => "(editor) -> RAILS.run (result)-> RAILS.initialized = !!result"
    }
    @stop = {
      :bindKeys => "win: 'Ctrl-.', linux: 'Ctrl-.', mac: 'Command-.'",
      :exec => "(editor) -> RAILS.clean()"
    }
  end
  
  def play
    @render = {
      :bindKeys => "win: 'Ctrl-Enter', linux: 'Ctrl-Enter', mac: 'Command-Enter'",
      :exec => "(editor) -> RAILS.run (result)-> RAILS.initialized = !!result"
    }
    @stop = {
      :bindKeys => "win: 'Ctrl-.', linux: 'Ctrl-.', mac: 'Command-.'",
      :exec => "(editor) -> RAILS.clean()"
    }
    
  end
  
end