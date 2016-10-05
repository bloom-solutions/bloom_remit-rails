require 'rails_helper'

module BloomRemit
  module Txns
    module Operations
      RSpec.describe Create, cleaning_strategy: :truncation do

        let(:user) { create(:bloom_remit_dummy_sub_user) }
        let(:biller) { create(:bloom_remit_dummy_biller, slug: "PLDT") }
        let(:payment) { create(:bloom_remit_dummy_sub_payment) }
        let(:external_id) { SecureRandom.hex(12) }

        it "creates a txn with a secret and enqueues the PayoutJob" do
          op = described_class.(txn: {
            target_slug: biller.slug,
            sender_id: user.id,
            sender_type: user.class.base_class.name,
            amount: 800.0,
            account_name: "028109090",
            account_id: "Hooli X",
            owner_id: payment.id,
            owner_type: payment.class.base_class.name,
            external_id: external_id,
            recipient_id: "recipient-id",
          })
          txn = op.model
          expect(txn.target_slug).to eq biller.slug
          expect(txn.sender).to eq user
          expect(txn.amount).to eq 800.0
          expect(txn.account_name).to eq "028109090"
          expect(txn.account_id).to eq "Hooli X"
          expect(txn.owner).to eq payment
          expect(txn.external_id).to eq external_id
          expect(txn.recipient_id).to eq "recipient-id"
          expect(PayoutJob).to have_enqueued_job(txn.id)
        end

      end
    end
  end
end
