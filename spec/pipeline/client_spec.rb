require 'spec_helper'

describe PipelineRuby::Client do
  before do
    PipelineRuby.configure do |c|
      c.host = "pipe.do"
      c.api_key = "37c41197-ae70-4429-9e99-fb94c8515096"
    end
  end

  describe ".base_url" do
    subject{ described_class.base_uri }
    before do
      PipelineRuby.configure do |c|
        c.host = "pipe.do"
      end
    end

    it{ should == "https://pipe.do/v1/" }
  end

  describe ".headers" do
    subject{ described_class.headers }

    before do
      PipelineRuby.configure do |c|
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

    it{ expect(response.code).to eql(200) }
  end

  describe ".delete", vcr: true do
    subject(:response){ described_class.delete("8cd6ea20-5a1a-443b-b60d-93503e9dcf20") }


    it{ expect(response.code).to eql(204) }
  end

  describe ".run", vcr: true do
    let(:data){ { "other" => "asdf","value" => 2} }

    subject(:response){ described_class.run("f6c22e30-a28c-48a4-9d43-a91b06e7690c", data) }

    it{ expect(response.code).to eql(204) }
  end

  describe ".create", vcr: true do
    let(:data){ {"pipeline"=>[{"seconds"=>10, "type"=>"delay", "name"=>"10 second delay"}, {"url"=>"https://api.destination.com", "type"=>"output", "name"=>"Output 1"}]} }

    subject(:response){ described_class.create(data) }

    it{ expect(response.code).to eql(201) }
    it{ expect(response.parsed_response).to eql({"id"=>"f6c22e30-a28c-48a4-9d43-a91b06e7690c"}) }
  end
end