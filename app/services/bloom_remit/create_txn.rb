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
    attribute :recipient_id, String

    include ActiveModel::Validations
    validates(
      :target_slug,
      :sender,
      :owner,
      :amount,
      :account_name,
      presence: true
    )

    def self.call(opts)
      create_txn = self.new(opts)
      fail ArgumentError, create_txn.errors.full_messages if create_txn.invalid?
      create_txn.()
    end

    def call
      txn_params = attributes.slice(*%i[
        amount
        account_name
        account_id
        target_slug
        external_id
        recipient_id
      ]).merge(
        sender_id: sender.id,
        sender_type: sender.class.base_class.name,
        owner_id: owner.id,
        owner_type: owner.class.base_class.name,
      )

      ::BloomRemit::Txns::Operations::Create.(txn: txn_params)
    end

  end
end
