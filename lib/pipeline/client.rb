module Pipeline
  class Client
    class << self
      def base_uri
        "https://#{Pipeline.configuration.host}/v1/"
      end

      def headers
        {"Content-Type" => "application/json", "APIKEY" => configuration.api_key}
      end

      def create(data)
        HTTParty.post("#{base_uri}pipelines", headers: headers, data: data.to_json, verify: false)
      end

      def get(pipeline_id)
        HTTParty.get("#{base_uri}pipelines/#{pipeline_id}", headers: headers, verify: false)
      end

      def delete(pipeline_id)
        HTTParty.delete("#{base_uri}pipelines/#{pipeline_id}", headers: headers, verify: false)
      end

      def run(pipeline_id, data)
        HTTParty.put("#{base_uri}pipelines/#{pipeline_id}/run", headers: headers, verify: false, data: data.to_json)
      end

      private

      def configuration
        Pipeline.configuration
      end
    end
  end
end