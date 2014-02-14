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
      "<------------------------------------------W-------------------------------------------->",
      "(try refresh your browser)",
      "...sometimes, your are unnable to hear (or see) some things...",
      "\n",
      "?ya wannabe careful with volume?",
      ">------------------------------------------AA--------------------------------------------<"
    ]
    @footer = {"license:" => "Creative Commons cc-by-sa 3.0", "email to:" => "yaknowboutblogmusic@gmail.com"}
    @helper = PlayHelper::Ace.new
    @src = ""
    File.foreach("./app/assets/javascripts/dashboard.js.coffee") { |line| @src << line << "\n" }
  end
  
  
  def play
    @helper = PlayHelper::Ace.new
    @src = ""
    File.foreach("./app/assets/javascripts/play.js.coffee") { |line| @src << line }
  end
  
end