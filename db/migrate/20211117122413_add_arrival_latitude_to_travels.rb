class AddArrivalLatitudeToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :arrival_latitude, :float
  end
end
