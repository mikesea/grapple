require 'test_helper'

describe Api::Properties do

  let(:user) { User.create(first_name: 'The', last_name: 'Dude', email: 'dude@example.com') }
  let(:property) { Property.create(name: 'The House', street_address: '123 Fake St.', city: 'Los Angeles', state: 'CA', zip: 90210, user_id: user.id) }

  it "returns a property" do
    get "api/properties/#{property.id}"

    assert_equal 200, last_response.status
    assert_equal property.id, JSON.parse(last_response.body)['id']
  end

  it "creates a property" do
    post "api/properties", property: { name: 'My House', street_address: '234 Lake St.', city: 'Minneapolis', state: 'MN', zip: 55455, user_id: user.id }

    assert_equal 201, last_response.status
    assert_equal Property.last.id, JSON.parse(last_response.body)['id']
  end

  it "updates a property" do
    put "api/properties/#{property.id}", property: { city: 'Venice' }

    assert_equal 200, last_response.status
    assert_equal 'Venice', JSON.parse(last_response.body)['city']
  end

  it "deletes a property" do
    delete "api/properties/#{property.id}"

    assert_equal 200, last_response.status
    assert_nil Property.find(id: property.id)
  end

end
