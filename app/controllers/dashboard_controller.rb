class DashboardController < ApplicationController
  def index
    @title = "Gibberish Experiments"
    @menu = {
      "fork me" => "https://www.github.com/jahpd/gibberish_experiments",
      "posts" => "/posts",
      "how to" => "/helps"
    }
    @footer = {"license:" => "Creative Commons cc-by-sa 3.0", "email to:" => "ttonmeister@gmail.com"}
  end
end
