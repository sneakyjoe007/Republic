class AddCategoryToEvent < ActiveRecord::Migration
  def up
    add_column :events, :category, :integer
  end

  def down
    remove_column :events, :category, :integer
  end
end
