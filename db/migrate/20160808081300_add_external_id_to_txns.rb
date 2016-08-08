class AddExternalIdToTxns < ActiveRecord::Migration
  def change
    add_column :bloom_remit_txns, :external_id, :string, null: false
    add_index :bloom_remit_txns, :external_id
  end
end
