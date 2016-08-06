require 'rails_helper'

module BloomRemit
  module Txns
    RSpec.describe Payout, ".call" do

      it "makes a call to Bloom Remit" do
        actions = [
          InitializeClient,
          Post,
          HandleResponse,
          RunHook,
        ]

        txn = build_stubbed(:bloom_remit_txn)

        ctx = LightService::Context.new(txn: txn)

        actions.each do |action|
          expect(action).to receive(:execute).with(ctx).and_return(ctx)
        end

        described_class.(txn)
      end

    end
  end
end
