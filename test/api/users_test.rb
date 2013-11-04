require 'test_helper'

describe Api::Users do

  let(:user) { User.create(first_name: 'The', last_name: 'Dude', email: 'dude@example.com') }

  it "returns a collection of users" do
    get "/api/users"

    assert_equal 200, last_response.status
    assert_equal User.count, JSON.parse(last_response.body).count
  end

  it "returns a user" do
    get "api/users/#{user.id}"

    assert_equal 200, last_response.status
    assert_equal user.id, JSON.parse(last_response.body)['id']
    assert_equal user.first_name, JSON.parse(last_response.body)['first_name']
    assert_equal user.last_name, JSON.parse(last_response.body)['last_name']
  end

  it "updates a user" do
    put "api/users/#{user.id}", user: { first_name: 'Anew', last_name: 'Name' }

    assert_equal 200, last_response.status
    assert_equal 'Anew', JSON.parse(last_response.body)['first_name']
    assert_equal 'Name', JSON.parse(last_response.body)['last_name']
  end

end
