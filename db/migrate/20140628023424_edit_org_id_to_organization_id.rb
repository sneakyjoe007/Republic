class EditOrgIdToOrganizationId < ActiveRecord::Migration
  def up
  	rename_column :events, :org_id, :organization_id
  end
end
