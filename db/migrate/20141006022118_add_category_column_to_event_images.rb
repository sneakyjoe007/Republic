class AddCategoryColumnToEventImages < ActiveRecord::Migration
  def change
  	add_column :event_images, :category_id, :integer
  	drop_attached_file :events, :image
  	add_column :events, :image_id, :integer
  end
end
