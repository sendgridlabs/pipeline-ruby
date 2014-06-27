module PipelineRuby
  class Client
    class << self
      def base_uri
        "https://#{PipelineRuby.configuration.host}/v1/"
      end

      def headers
        {"Content-Type" => "application/json", "APIKEY" => configuration.api_key}
      end

      def create(data)
        HTTParty.post("#{base_uri}pipelines", headers: headers, body: data.to_json, verify: false)
      end

      def get(pipeline_id)
        HTTParty.get("#{base_uri}pipelines/#{pipeline_id}", headers: headers, verify: false)
      end

      def delete(pipeline_id)
        HTTParty.delete("#{base_uri}pipelines/#{pipeline_id}", headers: headers, verify: false)
      end

      def run(pipeline_id, data)
        body = {"context_id" => "context1", "data" => data.to_json}.to_json
        HTTParty.put("#{base_uri}pipelines/#{pipeline_id}/run", body: body, headers: headers, verify: false)
      end

      private

      def configuration
        PipelineRuby.configuration
      end
    end
  end
end