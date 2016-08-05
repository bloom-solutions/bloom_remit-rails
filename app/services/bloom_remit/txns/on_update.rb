module BloomRemit
  module Txns
    class OnUpdate

      def self.call(txn)
        return if BloomRemit.on_txn_update.nil?
        BloomRemit.on_txn_update.(txn)
      end

    end
  end
end
