class CreateBloomRemitTxns < ActiveRecord::Migration
  def change
    create_table :bloom_remit_txns do |t|
      t.integer :status, null: false, default: 0
      t.string :recipient_type, null: false
      t.string :recipient_id, null: false
      t.references :sender, polymorphic: true, null: false
      t.decimal :amount, null: false
      t.string :account_name
      t.string :account_id
      t.uuid :secret, null: false
    end
  end
end
