require 'rails_helper'

module BloomRemit
  module Txns
    RSpec.describe Post do

      let(:user) do
        build_stubbed(:bloom_remit_dummy_user, bloom_remit_id: "sender-id")
      end
      let(:external_id) { SecureRandom.hex(12) }
      let(:txn) do
        build_stubbed(:bloom_remit_txn, {
          target_slug: "PLDT",
          sender: user,
          amount: BigDecimal.new(2000),
          account_name: "029925252",
          account_id: "12345678",
          external_id: external_id,
        })
      end
      let(:callback_url) do
        Engine.routes.url_helpers.api_v1_txn_url(txn, secret: txn.secret)
      end
      let(:client) { instance_double(BloomRemitClient::Client) }
      let(:response) { build(:bloom_remit_client_responses_payments_create) }

      it "posts the txn to Bloom Remit" do
        expect(client).to receive(:create_payment).with(
          sender_id: "sender-id",
          account_name: "029925252",
          account_number: "12345678",
          callback_url: callback_url,
          dest_currency: "PHP",
          orig_currency: "PHP",
          payout_method: "PLDT",
          paid_in_orig_currency: BigDecimal.new(2000),
          receivable_in_dest_currency: BigDecimal.new(2000),
          external_id: external_id,
        ).and_return(response)

        resulting_ctx = described_class.execute(txn: txn, client: client)

        expect(resulting_ctx.remote_response).to eq response
      end

    end
  end
end
