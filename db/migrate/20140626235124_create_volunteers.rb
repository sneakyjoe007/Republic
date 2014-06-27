class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.integer :event_id, :user_id
      t.timestamps
    end
  end
end
