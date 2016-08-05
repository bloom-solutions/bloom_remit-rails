require 'rails_helper'

module BloomRemit
  module Txns
    RSpec.describe OnUpdate do

      let(:txn) { build_stubbed(:bloom_remit_txn) }

      context "BloomRemit.on_txn_update is set" do
        before do
          BloomRemit.on_txn_update = TxnUpdate
        end

        it "delegates work to that class" do
          expect(TxnUpdate).to receive(:call).with(txn)
          described_class.(txn)
        end
      end

      context "BloomRemit.on_txn_update is not set" do
        before do
          BloomRemit.on_txn_update = nil
        end

        it "does not blow up" do
          expect { described_class.(txn) }.to_not raise_error
        end
      end

    end
  end
end
