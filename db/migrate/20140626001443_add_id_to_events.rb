class AddIdToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :user_id, :integer
  	add_column :events, :org_id, :integer
  end
end
