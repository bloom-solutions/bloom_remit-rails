class AddOwnerToBloomRemitTxns < ActiveRecord::Migration
  def change
    add_column :bloom_remit_txns, :owner_id, :string
    add_column :bloom_remit_txns, :owner_type, :string
    add_index :bloom_remit_txns, %i[owner_id owner_type]
  end
end
