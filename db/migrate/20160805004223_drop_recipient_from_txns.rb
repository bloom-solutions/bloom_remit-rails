class DropRecipientFromTxns < ActiveRecord::Migration
  def change
    remove_column :bloom_remit_txns, :recipient_id
    remove_column :bloom_remit_txns, :recipient_type
  end
end
