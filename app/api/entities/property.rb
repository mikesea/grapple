module Api
  module Entities
    class Property < Grape::Entity

      expose :id
      expose :name
      expose :street_address
      expose :city
      expose :state
      expose :zip

    end
  end
end
