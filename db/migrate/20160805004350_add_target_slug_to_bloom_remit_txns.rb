class AddTargetSlugToBloomRemitTxns < ActiveRecord::Migration
  def change
    add_column :bloom_remit_txns, :target_slug, :string, null: false
  end
end
