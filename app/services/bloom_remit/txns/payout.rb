module BloomRemit
  module Txns
    class Payout

      extend LightService::Organizer

      def self.call(txn)
        with(txn: txn).reduce(
          InitializeClient,
          Post,
          HandleResponse,
          RunHook,
        )
      end

    end
  end
end
