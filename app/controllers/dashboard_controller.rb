class DashboardController < ApplicationController
  def index
    @title = "Gibberish Experiments - An aplication to Blog-Eletroacoustic-Music"
    @menu = {
      "posts" => "/posts",
      "how to" => "/helps",
      "live-coding" => "/playmusic",
      "fork me on github" => "https://www.github.com/jahpd/gibberish_experiments",
    }
    @footer = {"license:" => "Creative Commons cc-by-sa 3.0", "email to:" => "ttonmeister@gmail.com"}
  end
end
