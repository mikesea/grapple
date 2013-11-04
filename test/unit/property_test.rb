require 'test_helper'

describe Property do

  it "validates for a user id" do
    property = Property.new(name: 'My house')

    refute property.valid?
  end
  
end
