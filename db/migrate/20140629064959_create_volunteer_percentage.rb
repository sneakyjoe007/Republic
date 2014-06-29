class CreateVolunteerPercentage < ActiveRecord::Migration
  def change
    add_column :events, :volunteers_percentage, :decimal, :precision => 4, :scale => 1
  end
end
