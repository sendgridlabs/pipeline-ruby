require 'spec_helper'

describe Pipeline::Client do
  describe ".base_url" do
    subject{ described_class.base_uri }

      Pipeline.configure do |c|
        c.host = "pipe.do"
      end

    it{ should == "https://pipe.do/v1/" }
  end

  describe ".headers" do
    subject{ described_class.headers }

    before do
      Pipeline.configure do |c|
        c.api_key = "fake_api_key"
      end
    end

    it{ should == {"Content-Type" => "application/json", "APIKEY" => "fake_api_key" } }
  end

  describe ".create" do
    pending
  end
end