Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :first_name
      String :last_name
      String :email
      DateTime :created_at
      DateTime :updated_at
    end

    create_table(:properties) do
      primary_key :id
      foreign_key :user_id
      String :name
      String :street_address
      String :city
      String :state
      Integer :zip
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
