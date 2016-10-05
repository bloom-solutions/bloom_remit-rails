require 'rails_helper'

module BloomRemit
  module Txns
    module Operations
      RSpec.describe Update, cleaning_strategy: :truncation do

        let(:user) { create(:bloom_remit_dummy_user) }
        let(:txn) { create(:bloom_remit_txn, sender: user) }

        it "creates the txn, and triggers BloomRemit.on_txn_update" do
          op = described_class.(
            id: txn.id,
            secret: txn.secret,
            status: "paid",
            status_description: "My status description",
            vendor_external_id: "vextid",
            tracking_number: "tracking-number",
            fake_id: "fake_id",
          )
          txn = op.model
          expect(txn.status).to eq "paid"
          expect(txn.status_description).to eq "My status description"
          expect(OnUpdateJob).to have_enqueued_job(txn.id, {
            id: txn.id,
            secret: txn.secret,
            status: "paid",
            status_description: "My status description",
            vendor_external_id: "vextid",
            tracking_number: "tracking-number",
            fake_id: "fake_id",
          })
        end

      end
    end
  end
end
