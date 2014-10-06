class CreateEventImages < ActiveRecord::Migration
  def change
    create_table :event_images do |t|
      t.string :name
      t.attachment :image

      t.timestamps
    end
  end
end
