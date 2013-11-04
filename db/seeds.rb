20.times do |x|
  u = User.create(first_name: 'User', last_name: "#{x}", email: "user-#{x}@example.com")

  rand(5).times do |x|
    u.add_property(name: "Property #{x}", street_address: "123 Fake St.", city: "San Francisco", state: "CA", zip: "94133")
  end
end
