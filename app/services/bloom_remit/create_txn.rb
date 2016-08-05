module BloomRemit
  class CreateTxn

    def self.call(target_slug:, sender:, owner:, amount:, account_name:, account_id:)
      Txns::Operations::Create.(txn: {
        sender_id: sender.id,
        sender_type: sender.class.base_class.name,
        amount: amount,
        account_name: account_name,
        account_id: account_id,
        target_slug: target_slug,
        owner_id: owner.id,
        owner_type: owner.class.base_class.name,
      })
    end

  end
end
