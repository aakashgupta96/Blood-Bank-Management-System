class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :hospital_id
      t.integer :bank_id
      t.string :blood_type
      t.integer :amount
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
