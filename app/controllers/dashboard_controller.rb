class DashboardController < ApplicationController
  def index
    @title = "Gibberish Experiments"
    @menu = {
      "fork me" => "https://www.github.com/jahpd/gibberish_experiments",
      "posts" => "/posts"
    }
    @footer = {:license => "Creative Commons cc-by-sa 3.0", :email_to => "ttonmeister@gmail.com"}
  end
end
