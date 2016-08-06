require 'rails_helper'

module BloomRemit
  module Txns
    RSpec.describe OnUpdateJob do

      it { is_expected.to be_retryable false }

      describe "#perform" do
        let(:txn) { build_stubbed(:bloom_remit_txn) }
        let(:params) { {status: "paid"} }

        it "delegates work to OnUpdate" do
          expect(Txn).to receive(:find).with(txn.id).and_return(txn)
          expect(OnUpdate).to receive(:call).with(txn, params)
          described_class.new.perform(txn.id, params)
        end
      end

    end
  end
end
