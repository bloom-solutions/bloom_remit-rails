module BloomRemit
  module Txns
    class OnUpdateJob

      include Sidekiq::Worker
      sidekiq_options retry: false

      def perform(txn_id)
        txn = Txn.find(txn_id)
        OnUpdate.(txn)
      end

    end
  end
end
