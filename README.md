grapple
=======

A sample API and Frontend using [Grape](https://github.com/intridea/grape) and [Knockout.js](http://knockoutjs.com/).

# Setup

1. Clone and `cd` into the repo.
2. Install dependencies: `$ bundle install`
3. Migrate and seed the database: `$ bundle exec rake db:reset`
4. Boot the app: `$ bundle exec rackup`
5. Visit http://localhost:9292 for the frontend interface.

# Tests

1. Migrate the test database: `$ RACK_ENV=test rake db:migrate`
2. Run the tests with: `$ bundle exec rake test`
