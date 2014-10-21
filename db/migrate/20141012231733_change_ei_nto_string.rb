class ChangeEiNtoString < ActiveRecord::Migration
  def up
  	change_column :organizations, :EIN, :string
  end

  def down
  	change_column :organizations, :EIN, :integer
  end
end
