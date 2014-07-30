class DeleteCategories < ActiveRecord::Migration
  def up
  	drop_table :Category
  end
end
