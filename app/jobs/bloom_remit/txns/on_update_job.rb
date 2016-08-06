module BloomRemit
  module Txns
    class OnUpdateJob

      include Sidekiq::Worker
      sidekiq_options retry: false

      def perform(txn_id, params)
        txn = Txn.find(txn_id)
        OnUpdate.(txn, params)
      end

    end
  end
end
