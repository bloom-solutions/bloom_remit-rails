module BloomRemit
  module Txns
    class Payout

      extend LightService::Organizer

      def self.call(txn)
        with(txn: txn).reduce(
          InitializeClient,
          Post,
        )
      end

    end
  end
end
