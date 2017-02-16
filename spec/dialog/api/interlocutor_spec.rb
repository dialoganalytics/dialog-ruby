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

  describe '#update_interlocutor' do
    before do
      stub_request(:patch, /api.dialoganalytics.com/)
        .to_return(status: 200, body: "{}", headers: { 'Content-Type'=>'application/json' })
    end

    let(:id) { 1 }
    let(:params) { { first_name: "Elon", last_name: "Musk" } }

    it "returns an interlocutor object" do
      expect(client.update_interlocutor(id, params)).to be_a(Hash)
    end
  end
end
