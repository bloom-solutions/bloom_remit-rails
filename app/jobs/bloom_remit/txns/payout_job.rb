module BloomRemit
  module Txns
    class PayoutJob

      include Sidekiq::Worker
      sidekiq_options retry: false

      def perform(txn_id)
        txn = Txn.find(txn_id)
        Payout.(txn)
      end

    end
  end
end
