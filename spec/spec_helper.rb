require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'

  add_group 'Libraries', '/lib/'
end

RSpec.configure do |config|
  require "pipeline"

  config.raise_errors_for_deprecations!

  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'

end