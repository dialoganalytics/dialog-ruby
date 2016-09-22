require 'spec_helper'

describe Dialog::Client do
  after do
    Dialog.reset!
  end

  context "with module configuration" do
    before do
      Dialog.configure do |config|
        config.api_token = 'token'
        config.bot_id = 'id'
      end
    end

    it "inherits the module configuration" do
      expect(Dialog.send(:api_token)).to eq('token')
      expect(Dialog.send(:bot_id)).to eq('id')
    end
  end

  context "with class configuration" do
    before do
      Dialog.configure do |config|
        config.api_token = 'token'
        config.bot_id = 'id'
      end
    end

    let(:client) { Dialog.new(api_token: 'another') }

    it "overrides the module configuration after initialization" do
      expect(client.api_token).to eq('another')
    end
  end

  describe "#request" do
    let(:client) { Dialog.new(api_token: 'token', bot_id: 'id') }

    it "raises on absent api_token" do
      client.api_token = nil
      expect { client.get("whatever") }.to raise_error(ArgumentError)
    end

    it "raises on absent bot_id" do
      client.bot_id = nil
      expect { client.get("whatever") }.to raise_error(ArgumentError)
    end
  end
end
