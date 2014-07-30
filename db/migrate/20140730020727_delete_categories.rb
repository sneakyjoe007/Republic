class DeleteCategories < ActiveRecord::Migration
  def up
  	drop_table :category
  end
end
