# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start do
  add_filter '/.internal_test_gem/'
  add_filter '/spec/'
end

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require 'engine_cart'
EngineCart.load_application!

require 'rspec/rails'

require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
Capybara.default_max_wait_time = 15

require 'warclight'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = 'rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
