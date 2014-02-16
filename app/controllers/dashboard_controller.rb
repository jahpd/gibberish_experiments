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
      :windows =>{:os=>"XP SPack:2",:firefox=>'27.0'}
    }
    @time = Time.now.httpdate
  end
  
  def play
    
  end
  
end