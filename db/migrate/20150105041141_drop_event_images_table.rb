class DropEventImagesTable < ActiveRecord::Migration
  def change
  	drop_table :event_images
  end
end
