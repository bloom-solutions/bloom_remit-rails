module BloomRemit
  module Txns
    class Post

      extend LightService::Action
      expects :client, :txn
      promises :remote_response

      executed do |c|
        txn = c.txn
        callback_url =
          Engine.routes.url_helpers.api_v1_txn_url(txn, secret: txn.secret)

        c.remote_response = c.client.create_txn(
          sender_id: txn.sender.send(BloomRemit.sender_id_method),
          account_name: txn.account_name,
          account_number: txn.account_id,
          callback_url: callback_url,
          currency: "PHP",
          target_slug: txn.target_slug,
          amount: txn.amount,
          client_external_id: txn.external_id,
        )
      end

    end
  end
end
