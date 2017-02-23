require 'spec_helper'

describe Dialog::API::Track do
  let(:client) { Dialog.new(api_token: 'token', bot_id: 'id') }

  describe '#attach' do
    context "with a String" do
      it "returns a Hash" do
        expect(client.attach("name")).to eq({ message: { name: "name" }})
      end
    end

    context "with a Hash" do
      it "returns a Hash" do
        expect(client.attach({ message: { name: "name" }})).to eq({ message: { name: "name" }})
      end
    end

    it "sets the correct context" do
      client.attach("name")
      expect(client.instance_variable_get(:@context)).to eq({ message: { name: "name" }})
    end

    it "sets the context" do
      expect(client.instance_variable_get(:@context)).to be_blank
      client.attach("name")
      expect(client.instance_variable_get(:@context)).not_to be_blank
    end
  end

  describe '#track' do
    before do
      stub_request(:post, /api.dialoganalytics.com/)
      .to_return(status: 201, headers: { 'Content-Type'=>'application/json' })
    end

    context "without a context" do
      before { client.attach({}) }

      it "returns the payload" do
        expect(client.track({ message: { platform: "messenger" }})).to eq({ message: { platform: "messenger" }})
      end
    end

    context "with a context" do
      before { client.attach("name") }

      it "returns the payload" do
        expect(client.track({ message: { platform: "messenger" }})).to eq({ message: { platform: "messenger", name: "name" }})
      end
    end
  end
end
