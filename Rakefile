require 'rake/testtask'
require File.expand_path('../config/application', __FILE__)

namespace :db do

  desc "Run database migrations"
  task :migrate do |cmd, args|
    Sequel.extension :migration
    Sequel::Migrator.apply(DB, 'db/migrations')
  end

  desc "Drop all tables in database"
  task :drop do |cmd, args|
    DB.tables.each do |table|
      DB.run("DROP TABLE #{table}")
    end
  end

  desc "Load Seed Data"
  task :seed do |cmd, args|
    seed_file = "db/seeds.rb"
    puts "Seeding data from: #{seed_file}"
    load(seed_file) if File.exist?(seed_file)
  end

  desc "Reset the database, migrate and seed data"
  task :reset => [:drop, :migrate, :seed]
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = "test/**/*_test.rb"
end
