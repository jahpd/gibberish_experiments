
require 'sinatra'
require './helpers/gibberish'

class GibberishExperiments < Sinatra::Base
  
  include Gibberish::Helpers
  
  get '/' do
    base({
      :title => "Gibberish Experiments",
      :menu => [:about, :simple_experiments],
      :footer => {:license => "Creative Commons cc-by-sa 3.0",:email_to => "ttonmeister@gmail.com", :build_with => "Ruby-Sinatra #{Sinatra::VERSION}"}
    })
    erb :index
  end
  
  get '/simple_experiments' do
    base({
      :menu => [:sine, :triangle, :saw, :PWM, "band limited saw", "White Noise"]
    })
    erb :simple_experiments
  end
  
  get '/:exp/synthesis' do
    query = env['rack.request.query_hash']
    base({
      :title => p,
      :gibberish_base => queryGibberish('base'),
      :options => queryGibberish(query["q"])
    })
    erb :synthesis
  end
  
  get '/about' do
    redirect "https://github.com/jahpd/gibberish_experiments"
  end
end

GibberishExperiments.run!