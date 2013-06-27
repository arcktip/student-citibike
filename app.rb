require 'rubygems'
require 'bundler'

Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Citibike
	class App < Sinatra::Application
    get '/' do
      data = File.open("data/citibikenyc.json").read
      @data = MultiJson.decode(data)
      puts @data
    end
	end
end