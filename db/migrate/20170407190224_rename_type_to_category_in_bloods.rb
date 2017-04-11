class RenameTypeToCategoryInBloods < ActiveRecord::Migration
  def change
  	rename_column :bloods, :type, :category
  end
end
