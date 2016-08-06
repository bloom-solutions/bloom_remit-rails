require 'rails_helper'

module BloomRemit
  module Txns
    RSpec.describe HandleResponse do

      let(:remote_response) do
        build(:bloom_remit_client_create_payment_response, {
          body: {"i" => "am body"},
        })
      end
      let(:txn) { create(:txn) }

      it "saves the response" do
        resulting_ctx = described_class.
          execute(txn: txn, remote_response: remote_response)
        expect(txn.responses.count).to eq 1
        expect(txn.responses.first).to eq resulting_ctx.response
        response = resulting_ctx.response
        expect(response.body).to eq({"i" => "am body"})
      end

    end
  end
end
