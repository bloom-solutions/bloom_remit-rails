require 'rails_helper'

module BloomRemit
  module Txns
    module Operations
      RSpec.describe Update do

        let(:user) { create(:bloom_remit_dummy_user) }
        let(:txn) { create(:bloom_remit_txn, sender: user) }

        it "creates the txn, and triggers BloomRemit.on_txn_update" do
          op = described_class.
            (id: txn.id, secret: txn.secret, status: "paid")
          txn = op.model
          expect(txn.status).to eq "paid"
          expect(OnUpdateJob).to have_enqueued_job(txn.id)
        end

      end
    end
  end
end
