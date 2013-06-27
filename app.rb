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
      @data = MultiJson.decode(json).sort_by{|station| station["free"]}.reverse
      erb :map
    end

    get '/form' do
      erb :form
    end

    post '/form' do
      "Hello World"
    end

  end
end