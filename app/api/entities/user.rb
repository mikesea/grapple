module Api
  module Entities
    class User < Grape::Entity

      expose :id
      expose :first_name
      expose :last_name
      expose :email
      expose :properties, using: Api::Entities::Property

    end
  end
end
