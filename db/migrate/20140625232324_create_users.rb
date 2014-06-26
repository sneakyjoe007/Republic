class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :about, :address, :city, :state
      t.integer :zip_code
      t.timestamps
    end
  end
end
