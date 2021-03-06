#ENV["RAILS_ENV"] ||= "test"
ENV["RAILS_ENV"] = "development"

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
  
  puts "ENV['RAILS_ENV']: " + ENV["RAILS_ENV"]

  # Add more helper methods to be used by all tests here...
end
