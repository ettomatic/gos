ENV['RACK_ENV'] = "test"

require File.expand_path(File.dirname(__FILE__) + "/../boot")

def app
  Sinatra::Application
end


RSpec.configure do |config|
  config.include Rack::Test::Methods
end
