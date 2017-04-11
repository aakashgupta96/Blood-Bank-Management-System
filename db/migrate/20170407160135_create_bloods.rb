class CreateBloods < ActiveRecord::Migration
  def change
    create_table :bloods do |t|
      t.integer :amount
      t.string :type
      t.integer :donor_id
      t.integer :bank_id

      t.timestamps null: false
    end
  end
end
