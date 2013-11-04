require 'app/api/users'
require 'app/api/properties'

require 'app/api/entities/property'
require 'app/api/entities/user'

module Api
  class Base < Grape::API

    mount Api::Users
    mount Api::Properties

  end
end
