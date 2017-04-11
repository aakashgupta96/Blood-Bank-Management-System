class RenameCompletedInOrders < ActiveRecord::Migration
  def change
  	rename_column :orders, :completed, :status
  end
end
