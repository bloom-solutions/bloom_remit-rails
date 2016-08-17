module BloomRemit
  module Txns
    module Contracts
      class Update < Reform::Form

        model ::BloomRemit::Txn
        property :status
        property :status_description
        property :vendor_external_id

      end
    end
  end
end
