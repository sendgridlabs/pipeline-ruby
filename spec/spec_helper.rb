require 'simplecov'
require 'rspec/its'
require 'vcr'

SimpleCov.start do
  add_filter '/spec/'

  add_group 'Libraries', '/lib/'
end

VCR.configure do |c|
  c.cassette_library_dir = "spec/vcr"
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.ignore_localhost = true
end

RSpec.configure do |config|
  require "pipeline"

  config.raise_errors_for_deprecations!

  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'

end