require 'spec_helper'

describe PipelineRuby::Configuration do
  subject(:configuration){ described_class.new }

  context "with default params" do
    it{ expect(configuration.api_key).to be(nil) }
    it{ expect(configuration.host).to eql("pipe.do") }
  end

  context "default params redefinition" do
    before do
      configuration.api_key           = "new_api_key"
      configuration.host              = "staging.pipe.do"
    end

    it{ expect(configuration.api_key).to eql("new_api_key") }
    it{ expect(configuration.host).to eql("staging.pipe.do") }
  end
end