require 'spec_helper'

describe PipelineRuby do
  describe ".configure" do
    subject(:configuration){ PipelineRuby.configuration }

    before do
      described_class.configure do |config|
        config.api_key = "api_key"
        config.host = 'staging.pipe.do'
      end
    end

    it{ expect(configuration.api_key).to eql("api_key") }
    it{ expect(configuration.host).to eql("staging.pipe.do") }
  end
end