module Api
  class Users < Grape::API

    format :json

    resource :users do

      desc "Returns a collection of users"

      get do
        present User.all, with: Api::Entities::User
      end

      # GET /users/123
      desc "Returns a User."

      params do
        requires :id, type: Integer, desc: "User id."
      end

      get ':id' do
        present User.find(id: params[:id]), with: Api::Entities::User
      end

      # PUT /users/123
      desc "Updates a User."

      params do
        requires :id, type: Integer, desc: "User id."

        group :user do
          optional :first_name, type: String
          optional :last_name, type: String
          optional :email, type: String
        end
      end

      put ':id' do
        user = User.find(id: params[:id])
        user.update(params[:user]) if user

        present user, with: Api::Entities::User
      end

    end

  end
end
