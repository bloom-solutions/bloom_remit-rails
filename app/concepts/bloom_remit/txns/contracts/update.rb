module BloomRemit
  module Txns
    module Contracts
      class Update < Reform::Form

        model ::BloomRemit::Txn
        property :status

      end
    end
  end
end
