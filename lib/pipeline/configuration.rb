module Pipeline
  class Configuration
    OPTIONS = [:api_key, :host].freeze

    # API key. Specific for project
    attr_accessor :api_key

    #Api hostname, default: pipe.do
    attr_accessor :host

    def initialize
      @host = "pipe.do"
    end
  end
end