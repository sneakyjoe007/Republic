class ChangeEventsColumns < ActiveRecord::Migration
  def change
  	add_column :events, :repeats, :string
  	add_column :events, :end_date, :date
  end
end
