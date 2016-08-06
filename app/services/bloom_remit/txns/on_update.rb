module BloomRemit
  module Txns
    class OnUpdate

      def self.call(txn, params)
        return if BloomRemit.on_txn_response.nil?
        BloomRemit.on_txn_response.(txn, params)
      end

    end
  end
end
