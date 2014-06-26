class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, :about
      t.string :address, :city, :state
      t.integer :zip_code

      t.timestamps
    end
  end
end
