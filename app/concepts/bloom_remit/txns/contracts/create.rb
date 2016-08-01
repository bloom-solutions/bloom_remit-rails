module BloomRemit
  module Txns
    module Contracts
      class Create < Reform::Form

        property :recipient_type
        property :recipient_id
        property :sender_type
        property :sender_id
        property :amount
        property :account_name
        property :account_id

      end
    end
  end
end
