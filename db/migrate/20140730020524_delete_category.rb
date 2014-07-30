class DeleteCategory < ActiveRecord::Migration
  def up
  	remove_column :events, :category
  end
end
