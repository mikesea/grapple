ENV['RACK_ENV'] = 'test'

require File.expand_path('../../config/application', __FILE__)

require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'json'

DatabaseCleaner.strategy = :transaction

class MiniTest::Spec
  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end

include Rack::Test::Methods

def app
  Grapple.application
end
