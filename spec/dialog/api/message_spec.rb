require 'spec_helper'

describe Dialog::API::Message do
  let(:client) { Dialog.new(api_token: 'token', bot_id: 'id') }

  describe '#messages' do
    before do
      stub_request(:get, /api.dialoganalytics.com/)
        .to_return(status: 200, body: "[]", headers: { 'Content-Type'=>'application/json' })
    end

    let(:conversation_id) { 1 }

    it "returns a collection of messages" do
      expect(client.messages(conversation_id)).to be_a(Array)
    end
  end

  describe '#message' do
    before do
      stub_request(:get, /api.dialoganalytics.com/)
        .to_return(status: 200, body: "{}", headers: { 'Content-Type'=>'application/json' })
    end

    let(:conversation_id) { 1 }
    let(:id) { 1 }

    it "returns a message object" do
      expect(client.message(conversation_id, id)).to be_a(Hash)
    end
  end
end
