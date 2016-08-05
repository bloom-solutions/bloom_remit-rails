class CreateBillers < ActiveRecord::Migration
  def change
    create_table :billers do |t|
      t.string :slug
    end
  end
end
