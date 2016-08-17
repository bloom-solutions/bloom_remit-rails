class AddVendorExternalIdToBloomRemitTxns < ActiveRecord::Migration
  def change
    add_column :bloom_remit_txns, :vendor_external_id, :string
    add_index :bloom_remit_txns, :vendor_external_id
  end
end
