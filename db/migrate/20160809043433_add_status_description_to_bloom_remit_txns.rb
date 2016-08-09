class AddStatusDescriptionToBloomRemitTxns < ActiveRecord::Migration
  def change
    add_column :bloom_remit_txns, :status_description, :text
  end
end
