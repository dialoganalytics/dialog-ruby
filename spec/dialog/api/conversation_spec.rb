require 'spec_helper'

describe Dialog::API::Conversation do
  let(:client) { Dialog.new(api_token: 'token', bot_id: 'id') }

  describe '#conversations' do
    before do
      stub_request(:get, /api.dialoganalytics.com/)
        .to_return(status: 200, body: "[]", headers: { 'Content-Type'=>'application/json' })
    end

    it "returns a collection of conversations" do
      expect(client.conversations).to be_a(Array)
    end
  end

  describe '#conversation' do
    before do
      stub_request(:get, /api.dialoganalytics.com/)
        .to_return(status: 200, body: "{}", headers: { 'Content-Type'=>'application/json' })
    end

    let(:id) { 1 }

    it "returns a conversation object" do
      expect(client.conversation(id)).to be_a(Hash)
    end
  end
end
