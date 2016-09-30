class AllowNullExternalIdForBloomRemitTxns < ActiveRecord::Migration
  def change
    change_column :bloom_remit_txns, :external_id, :string, null: true
  end
end
