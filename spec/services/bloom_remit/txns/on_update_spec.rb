require 'rails_helper'

module BloomRemit
  module Txns
    RSpec.describe OnUpdate do

      let(:txn) { build_stubbed(:bloom_remit_txn) }
      let(:params) { {backpack: "back"} }

      context "BloomRemit.on_txn_response is set" do
        before do
          BloomRemit.on_txn_response = OnTxnResponse
        end

        it "delegates work to that class" do
          expect(OnTxnResponse).to receive(:call).with(txn, params)
          described_class.(txn, params)
        end
      end

      context "BloomRemit.on_txn_response is not set" do
        before do
          BloomRemit.on_txn_response = nil
        end

        it "does not blow up" do
          expect { described_class.(txn, params) }.to_not raise_error
        end
      end

    end
  end
end
