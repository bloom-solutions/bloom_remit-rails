class AddRecipientIdToBloomRemitTxns < ActiveRecord::Migration
  def change
    add_column :bloom_remit_txns, :recipient_id, :string
  end
end
