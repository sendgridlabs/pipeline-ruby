require "httparty"
require "pipeline-ruby/version"
require "pipeline-ruby/configuration"
require "pipeline-ruby/client"

module PipelineRuby
  class << self

    # PipelineRuby.configure do |config|
    #    config.api_key = 'your_api_key'
    #    config.host    = 'pipe.do'
    # end
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
