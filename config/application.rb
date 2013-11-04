require File.expand_path('../boot', __FILE__)

require 'config/database'
DB = Sequel.connect( DB_CONFIG[ENV['RACK_ENV'].to_sym] )
Sequel::Model.plugin :timestamps
Sequel::Model.plugin :validation_helpers

require 'app/api/base'
Dir["app/models/*.rb"].each {|f| require f}

module Grapple

  def self.application
    Rack::Builder.new do

      use Rack::Static, root: 'public', index: 'index.html'

      map '/assets' do
        assets = Sprockets::Environment.new
        assets.append_path 'app/assets/javascripts'
        assets.append_path 'app/assets/css'
        assets.append_path 'vendor/assets/components'
        run assets
      end

      map '/api' do
        run ::Api::Base
      end

    end

  end

end
