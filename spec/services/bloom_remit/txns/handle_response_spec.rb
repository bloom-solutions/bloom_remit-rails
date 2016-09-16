require 'rails_helper'

module BloomRemit
  module Txns
    RSpec.describe HandleResponse do

      context "successful response" do
        let(:remote_response) do
          build(:bloom_remit_client_responses_payments_create, {
            success: true,
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

      context "unsuccessful response" do
        let(:remote_response) do
          build(:bloom_remit_client_responses_payments_create, {
            success: false,
            body: {"status"=>"500", "error"=>"Internal Server Error"},
          })
        end
        let(:txn) { create(:txn) }

        it "marks the txn as error" do
          resulting_ctx = described_class.
            execute(txn: txn, remote_response: remote_response)
          txn.reload
          expect(txn).to be_error
        end
      end

    end
  end
end
