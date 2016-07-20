class CreateBloomRemitBillers < ActiveRecord::Migration
  def change
    create_table :bloom_remit_billers do |t|
      t.string :slug, null: false
      t.text :description
      t.hstore :fields
      t.decimal :service_charge, default: 0.0, null: false
      t.datetime :deactivated_at
      t.timestamps null: false
    end
  end
end
