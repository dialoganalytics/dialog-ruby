require 'spec_helper'

describe Dialog::API::Interlocutor do
  let(:client) { Dialog.new(api_token: 'token', bot_id: 'id') }

  describe '#interlocutors' do
    before do
      stub_request(:get, /api.dialoganalytics.com/)
        .to_return(status: 200, body: "[]", headers: { 'Content-Type'=>'application/json' })
    end

    it "returns a collection of interlocutors" do
      expect(client.interlocutors).to be_a(Array)
    end
  end

  describe '#interlocutor' do
    before do
      stub_request(:get, /api.dialoganalytics.com/)
        .to_return(status: 200, body: "{}", headers: { 'Content-Type'=>'application/json' })
    end

    let(:id) { 1 }

    it "returns an interlocutor object" do
      expect(client.interlocutor(id)).to be_a(Hash)
    end
  end

  describe '#create_interlocutor' do
    let(:id) { 1 }

    context "with valid params" do
      before do
        stub_request(:post, /api.dialoganalytics.com/)
          .to_return(status: 200, body: "{}", headers: { 'Content-Type'=>'application/json' })
      end

      it "returns an interlocutor object" do
        expect(client.create_interlocutor(id)).to be_a(Hash)
      end
    end

    context "with invalid params" do
      before do
        stub_request(:post, /api.dialoganalytics.com/)
          .to_return(status: 422, body: { error: "something" }.to_json, headers: { 'Content-Type'=>'application/json' })
      end

      it "returns an error" do
        expect { client.create_interlocutor(id) }.to raise_error(Dialog::Error)
      end
    end
  end
end
