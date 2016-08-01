require 'rails_helper'

RSpec.describe "api/v1/txns" do

  describe "#update" do
    let(:txn) { create(:bloom_remit_txn, secret: SecureRandom.uuid) }
    let(:headers) do
      {
        "ACCEPT" => "application/json",
        "CONTENT_TYPE" => "application/json",
      }
    end

    it "updates the status of the txn" do
      patch(
        BloomRemit::Engine.routes.url_helpers.api_v1_txn_url(txn),
        {
          secret: "fake",
          txn: {status: "doesn't matter"}
        }.to_json,
        headers
      )
      expect(response.status).to be 404

      patch(
        BloomRemit::Engine.routes.url_helpers.api_v1_txn_url(txn),
        {
          secret: txn.secret, txn: {status: "paid"}
        }.to_json,
        headers
      )
      expect(response).to be_success
      expect(txn.reload).to be_paid
    end
  end

end
