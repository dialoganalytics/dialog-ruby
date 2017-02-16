require 'spec_helper'

describe Dialog::API::Event do
  let(:client) { Dialog.new(api_token: 'token', bot_id: 'id') }

  describe '#event' do
    context "with valid params" do
      before do
        stub_request(:post, /api.dialoganalytics.com/)
          .to_return(status: 200, body: "{}", headers: { 'Content-Type'=>'application/json' })
      end

      it "returns an event object" do
        expect(client.event('subscribed', Time.now.to_f, SecureRandom.uuid, { custom: 'value' })).to be_a(Hash)
      end
    end
  end

  describe '#create_event' do
    context "with valid params" do
      before do
        stub_request(:post, /api.dialoganalytics.com/)
          .to_return(status: 200, body: "{}", headers: { 'Content-Type'=>'application/json' })
      end

      let(:event_params) { {name: 'subscribed', created_at: Time.now.to_f, id: SecureRandom.uuid, properties: { custom: 'value' } }}

      it "returns an event object" do
        expect(client.create_event(event_params)).to be_a(Hash)
      end
    end
  end
end
