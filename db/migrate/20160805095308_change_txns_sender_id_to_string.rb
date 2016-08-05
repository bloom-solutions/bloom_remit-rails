class ChangeTxnsSenderIdToString < ActiveRecord::Migration
  def change
    change_column :bloom_remit_txns, :sender_id, :string
  end
end
