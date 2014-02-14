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
  
end