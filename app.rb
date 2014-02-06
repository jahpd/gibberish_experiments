
require 'sinatra'
require './helpers/gibberish'

class GibberishExperiments < Sinatra::Base
  
  include Gibberish::Helpers
  
  get '/' do
    base({
      :title => "Gibberish Experiments",
      :menu => [:about, :simple_experiments, :mixin_experiments],
      :footer => {:license => "Creative Commons cc-by-sa 3.0",:email_to => "ttonmeister@gmail.com", :build_with => "Ruby-Sinatra #{Sinatra::VERSION}"}
    })
    erb :index
  end
  
  get '/simple_experiments' do
    base({
      :menu => [:sine, :cosine, :triangle, 
        :saw, :PWM, "band limited saw", 
        "White Noise", :table, :karplus_strong]
    })
    erb :simple_experiments
  end
  
  get '/mixin_experiments' do
    base({
      :menu => [:simple_am, :ring_modulation, :allband_modulation,
        "phase_shift", :hilbert_transform, :singleband_am]
    })
    erb :mixin_experiments
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