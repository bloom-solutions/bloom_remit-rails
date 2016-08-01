require 'rails_helper'

module BloomRemit
  module Txns
    RSpec.describe PayoutJob do

      it { is_expected.to be_retryable false }

      describe "#perform" do
        let(:txn) { build_stubbed(:bloom_remit_txn) }

        it "posts the job to Bloom Remit" do
          expect(Txn).to receive(:find).with(txn.id).and_return(txn)
          expect(Payout).to receive(:call).with(txn)
          described_class.new.perform(txn.id)
        end
      end

    end
  end
end
