require 'bundler/setup'
require 'simplecov'
SimpleCov.start do
  add_filter 'spec/'
  add_filter 'vendor/'
  add_filter 'erb/'
  add_filter 'tmp/'
  add_filter 'Rakefile'
end

Bundler.setup
require 'aws_generate_cloudformation'

Dir['spec/support/**/*.rb'].each { |f| require File.expand_path(f) }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
