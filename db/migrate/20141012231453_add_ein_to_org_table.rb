class AddEinToOrgTable < ActiveRecord::Migration
  def change
    add_column :organizations, :EIN, :integer
  end
end
