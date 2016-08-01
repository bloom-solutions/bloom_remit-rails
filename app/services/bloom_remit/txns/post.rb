module BloomRemit
  module Txns
    class Post

      extend LightService::Action
      expects :client, :txn

      executed do |c|
        txn = c.txn

        c.client.create_payment(
          sender_id: txn.sender.send(BloomRemit.sender_id_method),
          account_name: txn.account_name,
          account_number: txn.account_id,
          callback_url: Engine.routes.url_helpers.api_v1_txn_url(txn),
          dest_currency: "PHP",
          orig_currency: "PHP",
          payout_method: txn.recipient.slug,
          receivable_in_dest_currency: txn.amount,
        )
      end

    end
  end
end
