require 'spec_helper'

describe Dialog::API::Event do
  let(:client) { Dialog.new(api_token: 'token', bot_id: 'id') }

  describe '#create_event' do
    it 'calls create_event', skip: true do      
    end
  end

  describe '#create_event' do
    context "with valid params" do
      before do
        stub_request(:post, /api.dialoganalytics.com/)
          .to_return(status: 200, body: "{}", headers: { 'Content-Type'=>'application/json' })
      end

      let(:event_params) { {name: 'subscribed', created_at: Time.now.to_f, interlocutor_id: SecureRandom.uuid, properties: { custom: 'value' } }}

      it "returns an event object" do
        expect(client.create_event(event_params)).to be_a(Hash)
      end
    end

    context "with invalid params" do
      before do
        stub_request(:post, /api.dialoganalytics.com/)
          .to_return(status: 422, body: { error: "something" }.to_json, headers: { 'Content-Type'=>'application/json' })
      end

      let(:event_params) { Hash.new }

      it "returns an error" do
        expect { client.create_event(event_params) }.to match({ error: "RecordInvalid" })
      end
    end
  end
end
