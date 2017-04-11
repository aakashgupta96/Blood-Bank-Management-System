class AddAttributesToDonor < ActiveRecord::Migration
  def change
  	add_column :donors, :full_name, :string,default: "",null: false
    add_column :donors, :sex, :string,default: "", null: false
    add_column :donors, :age, :integer,default: 0, null: false
    add_column :donors, :phone_no, :string,default: "", null: false
  end
end
