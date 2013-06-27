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
      @data = MultiJson.decode(json)
      erb :home
    end

    get '/map' do
      erb :map
    end
  end
end