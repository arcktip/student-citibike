require 'rubygems'
require 'bundler'

Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Citibike
	class App < Sinatra::Application
    get '/' do
      json = File.open("data/citibikenyc.json").read
      @data = MultiJson.decode(json).sort_by{|station| station["free"]}.reverse
      erb :home
    end

    get '/map' do
      json = File.open("data/citibikenyc.json").read
      @data = MultiJson.decode(json)
      erb :map
    end

    get '/form' do
      erb :form
    end

    post '/form' do  
      "Thanks for your thoughts on our first JSON site! '#{params[:message]}'"  
    end  

  end
end