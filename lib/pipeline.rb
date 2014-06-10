require "pipeline/version"
require "pipeline/configuration"
require "pipeline/client"

module Pipeline
  class << self

    # Pipeline.configure do |config|
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
