require 'spec_helper'

describe Dialog::API::Track do
  let(:client) { Dialog.new(api_token: 'token', bot_id: 'id') }

  describe '#track' do
    context "with valid params" do
      before do
        stub_request(:post, /api.dialoganalytics.com/)
          .to_return(status: 201, headers: { 'Content-Type'=>'application/json' })
      end

      it "returns nothing" do
        expect(client.track({})).to be_nil
      end
    end
  end
end
