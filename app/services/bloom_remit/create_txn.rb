module BloomRemit
  class CreateTxn

    def self.call(recipient:, sender:, amount:, account_name:, account_id:)
      Txns::Operations::Create.(txn: {
        recipient_id: recipient.id,
        recipient_type: recipient.class.name,
        sender_id: sender.id,
        sender_type: sender.class.name,
        amount: amount,
        account_name: account_name,
        account_id: account_id,
      })
    end

  end
end
