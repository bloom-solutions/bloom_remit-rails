module BloomRemit
  class CreateTxn

    include Virtus.model
    attribute :target_slug, String
    attribute :sender, String
    attribute :owner
    attribute :amount, Float
    attribute :account_name, String
    attribute :account_id, String
    attribute :external_id, String

    include ActiveModel::Validations
    validates(
      :target_slug,
      :sender,
      :owner,
      :amount,
      :account_name,
      :account_id,
      presence: true
    )

    def self.call(opts)
      create_txn = self.new(opts)
      fail ArgumentError, create_txn.errors.full_messages if create_txn.invalid?
      create_txn.()
    end

    def call
      ::BloomRemit::Txns::Operations::Create.(txn: {
        sender_id: sender.id,
        sender_type: sender.class.base_class.name,
        amount: amount,
        account_name: account_name,
        account_id: account_id,
        target_slug: target_slug,
        owner_id: owner.id,
        owner_type: owner.class.base_class.name,
        external_id: external_id,
      })
    end

  end
end
