require 'spec_helper'

describe Pipeline::Configuration do
  subject(:configuration){ described_class.new }

  context "with default params" do
    it{ expect(configuration.api_key).to be(nil) }
    it{ expect(configuration.host).to eql("pipe.do") }
    it{ expect(configuration.secure).to be(true) }
    it{ expect(configuration.http_open_timeout).to eql(1) }
    it{ expect(configuration.http_read_timeout).to eql(2) }
  end

  context "default params redefinition" do
    before do
      configuration.api_key           = "new_api_key"
      configuration.host              = "staging.pipe.do"
      configuration.secure            = false
      configuration.http_open_timeout = 5
      configuration.http_read_timeout = 10
    end

    it{ expect(configuration.api_key).to eql("new_api_key") }
    it{ expect(configuration.host).to eql("staging.pipe.do") }
    it{ expect(configuration.secure).to be(false) }
    it{ expect(configuration.http_open_timeout).to eql(5) }
    it{ expect(configuration.http_read_timeout).to eql(10) }
  end
end