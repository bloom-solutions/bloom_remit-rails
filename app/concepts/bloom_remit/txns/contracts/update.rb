module BloomRemit
  module Txns
    module Contracts
      class Update < Reform::Form

        model ::BloomRemit::Txn
        property :status
        property :status_description

      end
    end
  end
end
