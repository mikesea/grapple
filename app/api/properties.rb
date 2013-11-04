module Api
  class Properties < Grape::API

    format :json

    resource :properties do

      # GET /properties/123
      desc "Returns a Property."

      params do
        requires :id, type: Integer, desc: "Property id."
      end

      get ':id' do
        present Property.find(id: params[:id]), with: Api::Entities::Property
      end

      # POST /properties/123
      desc "Creates a Property."

      params do
        group :property do
          requires :user_id, type: Integer
          optional :name, type: String
          optional :street_address, type: String
          optional :city, type: String
          optional :state, type: String
          optional :zip, type: Integer
        end
      end

      post do
        property = Property.create(params[:property])

        present property, with: Api::Entities::Property
      end

      # PUT /properties/123
      desc "Updates a Property."

      params do
        requires :id, type: Integer, desc: "Property id."

        group :property do
          optional :name, type: String
          optional :street_address, type: String
          optional :city, type: String
          optional :state, type: String
          optional :zip, type: Integer
        end
      end

      put ':id' do
        property = Property.find(id: params[:id])
        property.update(params[:property]) if property

        present property, with: Api::Entities::Property
      end

      # DELETE /properties/123
      desc "Deletes a Property."

      params do
        requires :id, type: Integer, desc: "Property id."
      end

      delete ':id' do
        property = Property.find(id: params[:id])
        property.destroy if property

        present property, with: Api::Entities::Property
      end

    end

  end
end
