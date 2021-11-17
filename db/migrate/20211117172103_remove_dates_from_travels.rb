class RemoveDatesFromTravels < ActiveRecord::Migration[6.0]
  def change
    remove_column :travels, :departure_date
    remove_column :travels, :departure_hour
    remove_column :travels, :arrival_date
    remove_column :travels, :arrival_hour
  end
end
