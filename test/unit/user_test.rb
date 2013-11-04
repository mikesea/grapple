require 'test_helper'

describe User do

  it "creates a User" do
    user = User.create(email: "test@example.com", first_name: "Test", last_name: "Account")

    assert_empty user.errors
    assert user.id
  end

  it "protects against duplicate email addresses" do
    User.create(email: "snowflake@example.com")

    assert_raises Sequel::ValidationFailed do
      User.create(email: "snowflake@example.com")
    end
  end
  
end