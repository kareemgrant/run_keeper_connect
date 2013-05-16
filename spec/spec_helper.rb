# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# VCR.configure do |c|
#   c.allow_http_connections_when_no_cassette = true
#   c.cassette_library_dir = 'fixtures/vcr_cassettes'
#   c.hook_into :webmock
# end

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.include(OmniauthMacros)
end

OmniAuth.config.test_mode = true
