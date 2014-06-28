class DeleteUserAndOrgIds < ActiveRecord::Migration
  def up
  	remove_column :organizations, :org_id, :integer
  	remove_column :users, :user_id, :integer
  end
end
