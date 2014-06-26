class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, :address, :city, :state, :zip_code
      t.text :description
      t.integer :org_id
      t.integer :user_id
      t.date :event_date
      t.time :event_time

      t.timestamps
    end
  end
end
