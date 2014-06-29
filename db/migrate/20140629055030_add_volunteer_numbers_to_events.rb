class AddVolunteerNumbersToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :volunteers_needed, :integer
  	add_column :events, :volunteers_current, :integer
  end
end
