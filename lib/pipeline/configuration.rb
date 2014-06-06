module Pipeline
  class Configuration
    OPTIONS = [:api_key, :host, :secure, :port, :http_open_timeout, :http_read_timeout].freeze

    # API key. Specific for project
    attr_accessor :api_key

    #Api hostname, default: pipe.do
    attr_accessor :host

    #true for HTTPS, false for HTTP. default true
    attr_accessor :secure

    # The port on which your api runs (defaults to 443 for secure
    # connections, 80 for insecure connections).
    attr_writer :port

    # HTTP open timeout in seconds (defaults to 1).
    attr_accessor :http_open_timeout

    # HTTP read timeout in seconds (defaults to 2).
    attr_accessor :http_read_timeout


    def initialize
      @host              = "pipe.do"
      @http_open_timeout = 1
      @http_read_timeout = 2
      @secure            = true
    end
  end
end