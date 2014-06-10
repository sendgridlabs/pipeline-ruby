module Pipeline
  class Client
    class << self
      def base_uri
        "https://#{Pipeline.configuration.host}/v1/"
      end

      def headers
        {"Content-Type" => "application/json", "APIKEY" => configuration.api_key}
      end

      def create(params)
        HTTParty.post("#{base_uri}/pipelines", headers: headers, data: params)
      end

      private

      def configuration
        Pipeline.configuration
      end
    end
  end
end