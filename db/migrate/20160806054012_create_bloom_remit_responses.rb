class CreateBloomRemitResponses < ActiveRecord::Migration
  def change
    create_table :bloom_remit_responses do |t|
      t.integer :txn_id, null: false, index: true
      t.text :body, null: false
      t.timestamps null: false
    end
  end
end
