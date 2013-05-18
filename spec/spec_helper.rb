require 'simplecov'
require 'factory_girl_rails'
SimpleCov.start do
  add_filter '/spec'
  add_group 'apis', 'lib/runkeeper'
end

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
end

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
Dir["lib/**/*.rb"].each {|file| load(file); }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.include FactoryGirl::Syntax::Methods
  config.include(OmniauthMacros)
end

OmniAuth.config.test_mode = true
