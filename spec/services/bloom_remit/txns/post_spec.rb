require 'rails_helper'

module BloomRemit
  module Txns
    RSpec.describe Post do

      let(:biller) do
        build_stubbed(:bloom_remit_biller, slug: "PLDT")
      end
      let(:user) do
        build_stubbed(:bloom_remit_dummy_user, bloom_remit_id: "sender-id")
      end
      let(:txn) do
        build_stubbed(:bloom_remit_txn, {
          recipient: biller,
          sender: user,
          amount: BigDecimal.new(2000),
          account_name: "029925252",
          account_id: "12345678",
        })
      end
      let(:callback_url) do
        Engine.routes.url_helpers.api_v1_txn_url(txn)
      end
      let(:client) { instance_double(BloomRemitClient::Client) }

      it "posts the txn to Bloom Remit" do
        expect(client).to receive(:create_payment).with(
          sender_id: "sender-id",
          account_name: "029925252",
          account_number: "12345678",
          callback_url: callback_url,
          dest_currency: "PHP",
          orig_currency: "PHP",
          payout_method: biller.slug,
          receivable_in_dest_currency: BigDecimal.new(2000),
        )

        described_class.execute(txn: txn, client: client)
      end

    end
  end
end
