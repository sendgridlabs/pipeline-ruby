require 'spec_helper'

describe Pipeline::Client do
  describe ".base_url" do
    subject{ described_class.base_uri }
    before do
      Pipeline.configure do |c|
        c.host = "pipe.do"
      end
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

  describe ".get", vcr: true do
    subject(:response){ described_class.get("8cd6ea20-5a1a-443b-b60d-93503e9dcf20") }

    before do
      Pipeline.configure do |c|
        c.host = "pipe.do"
        c.api_key = "37c41197-ae70-4429-9e99-fb94c8515096"
      end
    end

    it{ expect(response.code).to eql(200) }
  end

  describe ".delete", vcr: true do
    subject(:response){ described_class.delete("8cd6ea20-5a1a-443b-b60d-93503e9dcf20") }

    before do
      Pipeline.configure do |c|
        c.host = "pipe.do"
        c.api_key = "37c41197-ae70-4429-9e99-fb94c8515096"
      end
    end

    it{ expect(response.code).to eql(204) }
  end

  describe ".run" do
    let(:data){ { "other" => "asdf","value" => 2} }

    subject(:response){ described_class.run("a96a390d-798d-4bf7-b131-462900ba78dd", data) }

    before do
      Pipeline.configure do |c|
        c.host = "pipe.do"
        c.api_key = "37c41197-ae70-4429-9e99-fb94c8515096"
      end
    end

    it{ expect(response.code).to eql(200) }
  end
end