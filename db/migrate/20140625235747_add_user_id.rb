class AddUserId < ActiveRecord::Migration
  def up
  	add_column :organizations, :org_id, :integer
  	add_column :users, :user_id, :integer
  end
end
