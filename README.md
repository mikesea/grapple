grapple
=======

A sample API and frontend using [Grape](https://github.com/intridea/grape) and [Knockout.js](http://knockoutjs.com/).

# Setup

1. Clone and `cd` into the repo.
2. Install dependencies: `$ bundle install`
3. Setup and migrate the database: `$ bundle exec rake db:setup`
4. Seed the database: `$ bundle exec rake db:seed`
5. Boot the app: `$ bundle exec rackup`
6. Visit http://localhost:9292 for the frontend interface.

# Tests

1. Setup the test database: `$ RACK_ENV=test rake db:setup`
2. Run the tests with: `$ bundle exec rake test`
